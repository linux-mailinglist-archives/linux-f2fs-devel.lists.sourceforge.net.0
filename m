Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D95AC3F14C5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Aug 2021 10:04:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGd2T-0001gd-7y; Thu, 19 Aug 2021 08:04:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mGd2K-0001gL-Qk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 08:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bK3cbkQsfGpKq1r/CNVo8v8Fm/WDd6H9bppzgyJHoDQ=; b=K6OV2al5u3pO4gobZn7/PRjZCS
 5ZijoZQKDZr6RBv8i0kyJUWuDsGsBEuCOJVUc/rds5BZwdcq+qMXNShdiQ4naOQxJKFWv4EmVFoJD
 rsn5pIa1qb6jVmfSP64w6hLB0/sIfGjqdKzAWXOYmyEslXAdeU3vLpAIINeY02uvLOFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bK3cbkQsfGpKq1r/CNVo8v8Fm/WDd6H9bppzgyJHoDQ=; b=eSsTJVbF4SQ+839bTd8NNC2m6s
 vqcEhkPxYG4demv5I/+qGg4+cZ98YyOOzEupjFIMrZI01Ccsv35fFCNbM74hkNyZshV94w7M1rclU
 sy88xTDcUrCv9G0Ip+zKpVxXhbuw5Q3tHdDRJbQGUSK80vu5cCKLiyWP6VYVyObR6pYM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGd2F-00BIkB-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 08:04:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4993261139;
 Thu, 19 Aug 2021 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629360258;
 bh=pu0ysrGHipCPaIG2y6nk/FcaajGch8ROclwW+cPMTlA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=klGfKQuG0JWx1ts+OWEOYXOrkS6Oe4DTXllQVs/cju6eJFL2fyy6Fp62FPdulqY3n
 xeKZPojvYrTbdEnqulkazrp+C3ISDA7ArsSrTK0Tkl3Ueg1E1HAbevJaJhotw0eBS8
 vuXVfQ9WdVqb+mkK+26sw4mVsGVefWKfrp4BeRC1qzK8BE8MxOTKSr/9D8h1tz3tcI
 Hkiir9eZuPAZGoVPi+EtixJdfIF5Nhv9/6Yxe04DQr8ikAZs/rVmtzywdsnd348yu3
 hfBZ3Asgt4xTr8VNnUFyiNbePbkYFbYOR/ecmb8lXdJYftJwIxVhstgt8fD1Pj0zwl
 iKh8d/pMqKeYA==
To: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
References: <AEYAigA8D7ZftrI0MRYeIqoY.3.1629098634558.Hmail.frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <492e1c4e-f39c-0460-0459-9c84aeaf407f@kernel.org>
Date: Thu, 19 Aug 2021 16:04:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AEYAigA8D7ZftrI0MRYeIqoY.3.1629098634558.Hmail.frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/8/16 15:23, 李扬韬 wrote: >>> HI Chao, >>>>> SBI_NEED_FSCK
    is an indicator that fsck.f2fs needs to be triggered, >>>>> this flag is
   set in too many places. For some scenes that are not very [...] 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mGd2F-00BIkB-Gj
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: introduce
 /sys/fs/f2fs/<disk>/fsck_stack node
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzE2IDE1OjIzLCDmnY7miazpn6wgd3JvdGU6Cj4+PiBISSBDaGFvLAo+Pj4+PiBT
QklfTkVFRF9GU0NLIGlzIGFuIGluZGljYXRvciB0aGF0IGZzY2suZjJmcyBuZWVkcyB0byBiZSB0
cmlnZ2VyZWQsCj4+Pj4+IHRoaXMgZmxhZyBpcyBzZXQgaW4gdG9vIG1hbnkgcGxhY2VzLiBGb3Ig
c29tZSBzY2VuZXMgdGhhdCBhcmUgbm90IHZlcnkKPj4+Pj4gcmVwcm9kdWNpYmxlLCBhZGRpbmcg
c3RhY2sgaW5mb3JtYXRpb24gd2lsbCBoZWxwIGxvY2F0ZSB0aGUgcHJvYmxlbS4KPj4+Pj4KPj4+
Pj4gTGV0J3MgcmVjb3JkIGFsbCBmc2NrIHN0YWNrIGhpc3RvcnksIEkgYWRkZWQgRjJGU19GU0NL
X1NUQUNLX1RSQUNFCj4+Pj4+IGNvbmZpZ3VyYXRpb24gb3B0aW9ucyBhbmQgc3lzZnMgbm9kZXMu
IEFmdGVyIG9wZW5pbmcgdGhlIGNvbmZpZ3VyYXRpb24KPj4+Pj4gb3B0aW9ucyBhbmQgZW5hYmxp
bmcgdGhlIG5vZGUsIGl0IHdpbGwgc3RhcnQgcmVjb3JkaW5nLiBUaGUgcmVjb3JkZWQKPj4+Pj4g
c3RhY2sgaW5mb3JtYXRpb24gd2lsbCBub3QgYmUgY2xlYXIsIGFuZCB3ZSBjYW4gZ2V0IGluZm9y
bWF0aW9uIGZvcm0KPj4+Pj4ga2VybmVsIGxvZy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
WWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICBEb2N1bWVu
dGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgfCAgNyArKysrCj4+Pj4+ICAgIGZzL2Yy
ZnMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKwo+Pj4+PiAgICBm
cy9mMmZzL2YyZnMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0NSArKysrKysrKysrKysr
KysrKysrKysrKysrCj4+Pj4+ICAgIGZzL2YyZnMvc3lzZnMuYyAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDI3ICsrKysrKysrKysrKysrKwo+Pj4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDg5IGlu
c2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vQUJJL3Rl
c3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMt
ZjJmcwo+Pj4+PiBpbmRleCBlZjRiOTIxOGFlMWUuLjA0N2MzOTgwOTNjZiAxMDA2NDQKPj4+Pj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzCj4+Pj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+Pj4+PiBAQCAtNDkzLDMg
KzQ5MywxMCBAQCBDb250YWN0OgkiQ2hhbyBZdSIgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KPj4+Pj4g
ICAgRGVzY3JpcHRpb246CVdoZW4gQVRHQyBpcyBvbiwgaXQgY29udHJvbHMgYWdlIHRocmVzaG9s
ZCB0byBieXBhc3MgR0NpbmcgeW91bmcKPj4+Pj4gICAgCQljYW5kaWRhdGVzIHdob3NlIGFnZSBp
cyBub3QgYmV5b25kIHRoZSB0aHJlc2hvbGQsIGJ5IGRlZmF1bHQgaXQgd2FzCj4+Pj4+ICAgIAkJ
aW5pdGlhbGl6ZWQgYXMgNjA0ODAwIHNlY29uZHMgKGVxdWFscyB0byA3IGRheXMpLgo+Pj4+PiAr
Cj4+Pj4+ICtXaGF0OgkJL3N5cy9mcy9mMmZzLzxkaXNrPi9mc2NrX3N0YWNrCj4+Pj4+ICtEYXRl
OgkJQXVndXN0IDIwMjEKPj4+Pj4gK0NvbnRhY3Q6CSJZYW5ndGFvIExpIiA8ZnJhbmsubGlAdml2
by5jb20+Cj4+Pj4+ICtEZXNjcmlwdGlvbjoJQ29udHJvbHMgdG8gZW5hYmxlL2Rpc2FibGUgZnNj
ayBzdGFjayB0cmFjZSwgeW91IGNhbiBnZXQgc3RhY2sKPj4+Pj4gKwkJaW5mb3JtYXRpb24gZnJv
bSBrZXJuZWwgbG9nLiBOb3RlIHRoYXQgdGhlIHJlY29yZGVkIHN0YWNrIGluZm9ybWF0aW9uCj4+
Pj4+ICsJCXdpbGwgbm90IGJlIGNsZWFyZWQuCj4+Pj4KPj4+PiBBZ2FpbiwgcGxlYXNlIGRvbid0
IGFkZCB0aGlzIGludG8gc3lzZnMuCj4+Cj4+T2gsIEkgbWlzc2VkIHRvIGNoZWNrIHRoZSBkZXRh
aWxzLi4uCj4+Cj4+PiAKPj4+IEkgYWRkZWQgdGhpcyBub2RlLCBwYXJ0IG9mIHRoZSBpZGVhIGlz
IHRvIHRyaWdnZXIgdGhlIGV4cG9ydCBvZiBzdGFjayBpbmZvcm1hdGlvbi4KPj4+IFRoZXJlIGlz
IG5vIGluZm9ybWF0aW9uIHRyYW5zbWl0dGVkIHRocm91Z2ggc3lzZnMgaGVyZSwgYnV0IHRoZSBy
ZWNvcmQgb2YgdGhlIHN0YWNrIGlzIHN3aXRjaGVkIG9uIGFuZCBvZmYuCj4+PiBJZiBkb24ndCBl
eHBvcnQgdGhpcyBpbmZvcm1hdGlvbiB0aHJvdWdoIHByb2NmcyBhbmQgc3lzZnMsIGlzIHRoZXJl
IGEgbW9yZSBhcHByb3ByaWF0ZSB3YXk/Cj4+Cj4+V2VsbCwgSSBkb3VidCB3aHkgd2Ugc2hvdWxk
IGV4cG9ydCBzdGFjayBpbmZvIHZpYSBwcm9jL3N5c2ZzIG5vZGUgb3IKPj5zeXNmcyBzd2l0Y2gu
Cj4+Cj4+VGhvc2UgaW5mbyB3aWxsIGFsd2F5cyBiZSBuZWVkZWQgdG8gdHJvdWJsZXNob290IGlz
c3VlcyBubyBtYXR0ZXIgaW4KPj51c2VyIG9yIGVuZyB2ZXJzaW9uIG9mIEFuZHJvaWQsIGNhbiB3
ZSBqdXN0IHByaW50IHRoZW0gZGlyZWN0bHkgaW50bwo+Pmtlcm5lbCBtZXNzYWdlLi4uIHdoYXQg
SSBjb25jZXJuIGlzIHdlIG1heSBsb3N0IHRoZSBidWcgc2NlbmUgZHVlIHRvCj4+bm8gb25lIGNh
biBoZWxwIHRvIHRyaWdnZXIgZG1lc2cgcHJpbnRpbmcgdmlhIHN5c2ZzLgo+Pgo+PkphZWdldWss
IHRob3VnaHRzPwo+Pgo+Pj4gCj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvS2NvbmZp
ZyBiL2ZzL2YyZnMvS2NvbmZpZwo+Pj4+PiBpbmRleCA3NjY5ZGU3YjQ5Y2UuLmY0NTFlNTY3ZTRh
OCAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9LY29uZmlnCj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
S2NvbmZpZwo+Pj4+PiBAQCAtMTM1LDMgKzEzNSwxMyBAQCBjb25maWcgRjJGU19GU19MWk9STEUK
Pj4+Pj4gICAgCWRlZmF1bHQgeQo+Pj4+PiAgICAJaGVscAo+Pj4+PiAgICAJICBTdXBwb3J0IExa
Ty1STEUgY29tcHJlc3MgYWxnb3JpdGhtLCBpZiB1bnN1cmUsIHNheSBZLgo+Pj4+PiArCj4+Pj4+
ICtjb25maWcgRjJGU19GU0NLX1NUQUNLX1RSQUNFCj4+Pj4KPj4+PiBJIGRvbid0IHRoaW5rIHdl
IG5lZWQgYW5vdGhlciBjb25maWcgdG8gd3JhcCB0aGlzIGZ1bmN0aW9uYWxpdHksIG1heSBiZSB3
ZQo+Pj4+IGNhbiB1c2UgRjJGU19DSEVDS19GUyBpbnN0ZWFkLgo+Pj4gCj4+PiBPSy4KPj4+IAo+
Pj4+Cj4+Pj4+ICsJYm9vbCAiRjJGUyBmc2NrIHN0YWNrIGluZm9ybWF0aW9uIHJlY29yZCIKPj4+
Pj4gKwlkZXBlbmRzIG9uIEYyRlNfRlMKPj4+Pj4gKwlkZXBlbmRzIG9uIFNUQUNLREVQT1QKPj4+
Pj4gKwlkZWZhdWx0IHkKPj4+Pj4gKwloZWxwCj4+Pj4+ICsJIFN1cHBvcnQgcHJpbnRpbmcgb3V0
IGZzY2sgc3RhY2sgaGlzdG9yeS4gV2l0aCB0aGlzLCB5b3UgaGF2ZSB0bwo+Pj4+PiArCSB0dXJu
IG9uICJmc2NrX3N0YWNrIiBzeXNmcyBub2RlLiBUaGVuIHlvdSBjYW4gZ2V0IGluZm9ybWF0aW9u
Cj4+Pj4+ICsJIGZyb20ga2VybmVsIGxvZy4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJm
cy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gaW5kZXggZWU4ZWIzM2UyYzI1Li5iMmQxZDFhNWEz
ZmMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+ICsrKyBiL2ZzL2YyZnMv
ZjJmcy5oCj4+Pj4+IEBAIC0yNCw2ICsyNCw4IEBACj4+Pj4+ICAgICNpbmNsdWRlIDxsaW51eC9x
dW90YW9wcy5oPgo+Pj4+PiAgICAjaW5jbHVkZSA8bGludXgvcGFydF9zdGF0Lmg+Cj4+Pj4+ICAg
ICNpbmNsdWRlIDxjcnlwdG8vaGFzaC5oPgo+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L3N0YWNrZGVw
b3QuaD4KPj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9zdGFja3RyYWNlLmg+Cj4+Pj4+ICAgIAo+Pj4+
PiAgICAjaW5jbHVkZSA8bGludXgvZnNjcnlwdC5oPgo+Pj4+PiAgICAjaW5jbHVkZSA8bGludXgv
ZnN2ZXJpdHkuaD4KPj4+Pj4gQEAgLTExNyw2ICsxMTksOCBAQCB0eXBlZGVmIHUzMiBuaWRfdDsK
Pj4+Pj4gICAgCj4+Pj4+ICAgICNkZWZpbmUgQ09NUFJFU1NfRVhUX05VTQkJMTYKPj4+Pj4gICAg
Cj4+Pj4+ICsjZGVmaW5lIEZTQ0tfU1RBQ0tfREVQVEgJCTY0Cj4+Pj4KPj4+PiAxNj8KPj4+IAo+
Pj4gT0suCj4+PiAKPj4+Pgo+Pj4+PiArCj4+Pj4+ICAgIHN0cnVjdCBmMmZzX21vdW50X2luZm8g
ewo+Pj4+PiAgICAJdW5zaWduZWQgaW50IG9wdDsKPj4+Pj4gICAgCWludCB3cml0ZV9pb19zaXpl
X2JpdHM7CQkvKiBXcml0ZSBJTyBzaXplIGJpdHMgKi8KPj4+Pj4gQEAgLTE3NDgsNiArMTc1Miwx
MSBAQCBzdHJ1Y3QgZjJmc19zYl9pbmZvIHsKPj4+Pj4gICAgCXVuc2lnbmVkIGludCBjb21wcmVz
c193YXRlcm1hcms7CS8qIGNhY2hlIHBhZ2Ugd2F0ZXJtYXJrICovCj4+Pj4+ICAgIAlhdG9taWNf
dCBjb21wcmVzc19wYWdlX2hpdDsJCS8qIGNhY2hlIGhpdCBjb3VudCAqLwo+Pj4+PiAgICAjZW5k
aWYKPj4+Pj4gKyNpZmRlZiBDT05GSUdfRjJGU19GU0NLX1NUQUNLX1RSQUNFCj4+Pj4+ICsJZGVw
b3Rfc3RhY2tfaGFuZGxlX3QgKmZzY2tfc3RhY2tfaGlzdG9yeTsKPj4+Pj4gKwl1bnNpZ25lZCBp
bnQgZnNja19jb3VudDsKPj4+Pj4gKwlib29sIGZzY2tfc3RhY2s7Cj4+Pj4KPj4+PiBJTU8sIGFs
bCBidWdfb24oKXMgYXJlIGNvcm5lciBjYXNlcywgYW5kIGNhdGNoaW5nIHRob3NlIHN0YWNrcyB3
b24ndCBjb3N0Cj4+Pj4gbXVjaCwgc28gd2UgY2FuIGp1c3QgdXNlIENPTkZJR19YWFggdG8gZW5h
YmxlL2Rpc2FibGUgdGhpcyBmZWF0dXJlLgo+Pj4gCj4+PiBGMkZTX0NIRUNLX0ZTIO+8nwo+Pj4g
Cj4+Pj4KPj4+Pj4gKyNlbmRpZgo+Pj4+PiAgICB9Owo+Pj4+PiAgICAKPj4+Pj4gICAgc3RydWN0
IGYyZnNfcHJpdmF0ZV9kaW8gewo+Pj4+PiBAQCAtMTk1NCw2ICsxOTYzLDM4IEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKk5PREVfTUFQUElORyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpCj4+Pj4+ICAgIAlyZXR1cm4gc2JpLT5ub2RlX2lub2RlLT5pX21hcHBpbmc7Cj4+
Pj4+ICAgIH0KPj4+Pj4gICAgCj4+Pj4+ICsjaWZkZWYgQ09ORklHX0YyRlNfRlNDS19TVEFDS19U
UkFDRQo+Pj4+PiArc3RhdGljIHZvaWQgZnNja19zdGFja190cmFjZShzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpCj4+Pj4+ICt7Cj4+Pj4+ICsJdW5zaWduZWQgbG9uZyBlbnRyaWVzW0ZTQ0tfU1RB
Q0tfREVQVEhdOwo+Pj4+PiArCWRlcG90X3N0YWNrX2hhbmRsZV90IHN0YWNrLCAqbmV3Owo+Pj4+
PiArCXVuc2lnbmVkIGludCBucl9lbnRyaWVzOwo+Pj4+PiArCWludCBpOwo+Pj4+PiArCj4+Pj4+
ICsJaWYgKCFzYmktPmZzY2tfc3RhY2spCj4+Pj4+ICsJCXJldHVybjsKPj4+Pj4gKwo+Pj4+PiAr
CW5yX2VudHJpZXMgPSBzdGFja190cmFjZV9zYXZlKGVudHJpZXMsIEFSUkFZX1NJWkUoZW50cmll
cyksIDApOwo+Pj4+PiArCW5yX2VudHJpZXMgPSBmaWx0ZXJfaXJxX3N0YWNrcyhlbnRyaWVzLCBu
cl9lbnRyaWVzKTsKPj4+Pj4gKwlzdGFjayA9IHN0YWNrX2RlcG90X3NhdmUoZW50cmllcywgbnJf
ZW50cmllcywgR0ZQX0tFUk5FTCk7Cj4+Pj4+ICsJaWYgKCFzdGFjaykKPj4+Pj4gKwkJcmV0dXJu
Owo+Pj4+PiArCj4+Pj4+ICsJLyogVHJ5IHRvIGZpbmQgYW4gZXhpc3RpbmcgZW50cnkgZm9yIHRo
aXMgYmFja3RyYWNlICovCj4+Pj4+ICsJZm9yIChpID0gMDsgaSA8IHNiaS0+ZnNja19jb3VudDsg
aSsrKQo+Pj4+PiArCQlpZiAoc2JpLT5mc2NrX3N0YWNrX2hpc3RvcnlbaV0gPT0gc3RhY2spCj4+
Pj4+ICsJCQlyZXR1cm47Cj4+Pj4+ICsKPj4+Pj4gKwluZXcgPSBrcmVhbGxvYyhzYmktPmZzY2tf
c3RhY2tfaGlzdG9yeSwgKHNiaS0+ZnNja19jb3VudCArIDEpICoKPj4+Pj4gKwkJICAgICAgIHNp
emVvZigqc2JpLT5mc2NrX3N0YWNrX2hpc3RvcnkpLCBHRlBfS0VSTkVMKTsKPj4+Pj4gKwlpZiAo
IW5ldykKPj4+Pj4gKwkJcmV0dXJuOwo+Pj4+PiArCj4+Pj4+ICsJc2JpLT5mc2NrX3N0YWNrX2hp
c3RvcnkgPSBuZXc7Cj4+Pj4+ICsJc2JpLT5mc2NrX3N0YWNrX2hpc3Rvcnlbc2JpLT5mc2NrX2Nv
dW50KytdID0gc3RhY2s7Cj4+Pj4KPj4+PiBJdCB3aWxsIGNhc2UgbWVtb3J5IGxlYWsgYWZ0ZXIg
ZjJmcyBtb2R1bGUgZXhpdHMuCj4+PiAKPj4+IFNvIGxldCdzIGVuYWJsZSB0aGlzIGZlYXR1cmUg
d2hlbiBmMmZzIGlzIG5vdCBhIG1vZHVsZSBhbmQgZW5hYmxlIEYyRlNfQ0hFQ0tfRlMuCj4+Cj4+
SSBtZWFuIGl0IG5lZWRzIHRvIGZyZWUgLmZzY2tfc3RhY2tfaGlzdG9yeSBkdXJpbmcgdW1vdW50
KCkuCj4gID4KPiAKPiBTbyB0aGlzIGlzIGEgZG91YmxlLWVkZ2VkIHN3b3JkLCBhbmQgdGhlIHBl
cnNvbiB3aG8gdXNlcyBpdCBtdXN0IGJlIGF3YXJlIG9mIHRoaXMgaXNzdWUuCj4gVGhlIHJlbGVh
c2Ugc2VlbXMgdW5yZWFsaXN0aWMgdW5kZXIgdGhlIGN1cnJlbnQgY2lyY3Vtc3RhbmNlcy4gVGhp
cyBpcyBhbHNvIHRoZSByZWFzb24KCllvdSBtZWFuIHRoZSBoYW5kbGVzIGFsbG9jYXRlZCBmcm9t
IHN0YWNrX2RlcG90X3NhdmUoKSBzaG91bGQgbm90IGJlIHJlbGVhc2VkLCByaWdodD8KCj4gd2h5
IEkgYWRkIGEgc3dpdGNoLCBpbnN0ZWFkIG9mIGVuYWJsaW5nIGl0IGJ5IGRlZmF1bHQgYWZ0ZXIg
b3BlbmluZyB0aGUgY29uZmlndXJhdGlvbi4KCldlbGwsIEkgc3RpbGwgZGlkbid0IGdldCB3aHkg
d2UgY2FuIG5vdCByZWxlYXNlIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGJ5IGtyZWFsbG9jKCkuCgpU
aGFua3MsCgo+IAo+IFlhbmd0YW8KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
