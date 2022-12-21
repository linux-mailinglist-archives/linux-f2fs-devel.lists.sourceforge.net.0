Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2826532C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 15:55:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p80VO-0005Sn-LN;
	Wed, 21 Dec 2022 14:55:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@omp.ru>) id 1p80VN-0005Sa-Jc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 14:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fq8cT+sPnUuF1RgskyMpwDwJkW4IT2ki6fZFRzRIT8M=; b=f6m83UnESXakNQg9ZIL5P4XmKp
 jXZW83KK8OL52hwftfVO1sEubncFSFNyQMpKxQdDa8R0S3HvqSZME2koppDrhtDAA4HXx6aIhNoPE
 pLkB8sikESYnWqsjUH1eP/W37b3BTelXVUdalld8IEGqiv0Iv+T/TAjkBnV4W4eaSJPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fq8cT+sPnUuF1RgskyMpwDwJkW4IT2ki6fZFRzRIT8M=; b=EJ6kXwO2ZtoBmPyJ8F6oH5Ua/7
 FA9AioAgRc8Pcx4wtf7x7neHTzPIULTYP4RkpgiBdKT0XGth1B2VKvyACoV6Yf6t3wYAuSb54KJ21
 6GZfQG1C3+SqZ6Ri/TGBdaesGgdyIjnwe+ACZChI+xggHUI/SrW5bWbrEFDoaIjWRvfg=;
Received: from mx01.omp.ru ([90.154.21.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1p80VL-0005iX-Ux
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 14:55:37 +0000
Received: from [192.168.1.103] (178.176.72.202) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Wed, 21 Dec
 2022 17:55:21 +0300
To: Chao Yu <chao@kernel.org>, Yangtao Li <frank.li@vivo.com>
References: <20221221033021.36615-1-frank.li@vivo.com>
 <c532ee2b-66bb-9227-ebd7-a070599fe3ae@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5296767d-1dfa-7d86-3f47-ace8765ebc2d@omp.ru>
Date: Wed, 21 Dec 2022 17:55:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c532ee2b-66bb-9227-ebd7-a070599fe3ae@kernel.org>
Content-Language: en-US
X-Originating-IP: [178.176.72.202]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 12/21/2022 14:38:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 174331 [Dec 21 2022]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.202 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.202 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 178.176.72.202:7.1.2,7.7.3,7.4.1; 127.0.0.199:7.1.2; omp.ru:7.1.1
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.72.202
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/21/2022 14:41:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/21/2022 10:52:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/21/22 3:34 PM, Chao Yu wrote: [...] >>> In expand_inode_data(),
    the 'new_size' local variable is initialized to >>> the result of i_size_read(),
    however this value isn't ever used,  so we >>> can drop this initializer...
    >>> >>> [...] 
 
 Content analysis details:   (-1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p80VL-0005iX-Ux
Subject: Re: [f2fs-dev] [PATCH REPOST] f2fs: file: drop useless initializer
 in expand_inode_data()
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjEvMjIgMzozNCBQTSwgQ2hhbyBZdSB3cm90ZToKClsuLi5dCj4+PiBJbiBleHBhbmRf
aW5vZGVfZGF0YSgpLCB0aGUgJ25ld19zaXplJyBsb2NhbCB2YXJpYWJsZSBpcyBpbml0aWFsaXpl
ZCB0bwo+Pj4gdGhlIHJlc3VsdCBvZiBpX3NpemVfcmVhZCgpLCBob3dldmVyIHRoaXMgdmFsdWUg
aXNuJ3QgZXZlciB1c2VkLMKgIHNvIHdlCj4+PiBjYW4gZHJvcCB0aGlzIGluaXRpYWxpemVyLi4u
Cj4+Pgo+Pj4gRm91bmQgYnkgTGludXggVmVyaWZpY2F0aW9uIENlbnRlciAobGludXh0ZXN0aW5n
Lm9yZykgd2l0aCB0aGUgU1ZBQ0Ugc3RhdGljCj4+PiBhbmFseXNpcyB0b29sLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+Cj4+Pgo+Pj4g
LS0tCj4+PiBUaGlzIHBhdGNoIGlzIGFnYWluc3QgdGhlICdkZXYnIGJyYW5jaCBvZiBKYWVnZXVr
IEtpbSdzIEYyRlMgcmVwby4uLgo+Pj4gUmVwb3N0aW5nIHdpdGggSVNQIFJBUyBtYWlsaW5nIGxp
c3RzIENDJ2VkIG5vdy4uLgo+Pgo+PiBXaHkgZG8geW91IHJlcGVhdGVkbHkgc2VuZCBhIHBhdGNo
IHRoYXQgY2Fubm90IGJlIGFwcGxpZWQsIGFuZCB0aGlzIGRvZXMgbm90IGhhdmUKPiAKPiBUaGUg
Zm9ybWF0IGlzIHdlaXJlZCwgYnV0IHN0aWxsIEkgY2FuIGFwcGx5IHRoaXMgaW50byBteSBnaXQg
cmVwby4uLgoKICAgVGhpcyBpcyBqdXN0IHRoZSBxdWlsdCdzIGZvcm1hdC4gSSBub3JtYWxseSB1
c2UgcXVpbHQgZm9yIGRldmVsb3BtZW50CmFuZCB0aGVuIGltcG9ydCBteSBwYXRjaCBzZWllcyB0
byBnaXQgaW4gb3JkZXIgdG8gcHJlcGFyZSBpdCBmb3IgcG9zdGluZy4KSWYgSSBwb3N0IGEgc2lu
Z2xlIHBhdGNoLCBJIGp1c3Qgc2tpcCB0aGUgZ2l0IHN0ZXAgYW5kIHBvc3Qgd2l0aCBteSBNVEEu
Li4KClsuLi5dCgo+PiBUaHgsCj4+IFlhbmd0YW8KCk1CUiwgU2VyZ2V5CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
