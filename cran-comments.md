## Test environments
* local Windows install, R 3.3.3
* ubuntu 12.04 (on travis-ci), R 3.3.3 and R 3.2.4, R devel
* Mac OS X 10.11.6 (El Capitan) (on travis-ci), R 3.2.4 
* Appveyor  Windows install (64 bit 32 bit release, old release and stable)

## R CMD check results

0 errors | 0 warnings | 2 note

They are listed below:

NOTE
Registration problem:
  symbol 'sym' in the local frame:
   .Call(sym, PACKAGE = pkg)
   
The parsers are generated based on the grammar and then compiled.
Therefore, this is not registered until after the parser has been
generated.

NOTE Maintainer: 'Matthew Fidler <matthew.fidler@gmail.com>'

New submission

License components with restrictions and base license permitting such:
  BSD_3_clause + file LICENSE
File 'LICENSE':
  BSD 3-Clause License
  
  R interface portion Copyright (c) 2016, Matthew Fidler
  Overall dparser Copyright (c) 1994-2015 John Bradley Plevyak
  All rights reserved.
  
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
  
  * Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.
  
  * Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.
  
  * Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.
  
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  
This matches the license of dparser.  

* checking foreign function calls 

No foreign function calls.

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.


* All maintainers were notified of the CRAN submission.
