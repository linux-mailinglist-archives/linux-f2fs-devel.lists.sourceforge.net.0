Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC3707C24
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 10:35:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzZ65-00043a-UH;
	Thu, 18 May 2023 08:34:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pzZ64-00043U-HE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 08:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJpII3Sh4zxUzjhLXwlz9hFzHvVjO8XVHlA9ua7fDqo=; b=Tb3mqQjWEOkujIXw5OSnELrq4y
 ffe06T+sYFo1Bfg917kC8v/MDijEv16pWT0k83VeQVWz9MJb8cLOc8r0q4EuwSGx8G1UOdBwgWnmW
 3/l22JLHAsp2HoY8BxKgYLnz0sHcj5bDUjRzKjgbm3lESJHhWSRe3pah1TT4b4S4/d1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kJpII3Sh4zxUzjhLXwlz9hFzHvVjO8XVHlA9ua7fDqo=; b=B
 +xhXH2M7dYCNQjSQn08j7BQ8HmQGECWHW+FKBw1j6uyLOGllVZNSwHmHBpUCkSUjRmnFf7o+96G8f
 Ov6cxlm+4wQbdDlRn6huE8Z4mGkvDC/YxjEaabF4Arunt3bVNoCv+8YMX0Dd4BzTguWlf0F4phQ7Q
 ttyXNslTBbZTkBY4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzZ63-0002SI-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 08:34:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB5F261092;
 Thu, 18 May 2023 08:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C023CC433EF;
 Thu, 18 May 2023 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684398880;
 bh=nidHw/D03k42QIJ2HSyH6xaiVhz5OqrDcGXUjy+MrJc=;
 h=From:To:Cc:Subject:Date:From;
 b=pnyHYexrYMeifCfebpTF0Rkw7h634aIyi4JbvLnS4qDLee7NJj2qOZvST332fS0Xx
 xZ8MlLw+FO8wztUJij818iuew53MrYVTVVMYi8XFEPBDTOZvykzJfXJ0Km44BQ/E11
 hUK1itLLK1bIGtRPWMvhoxrdOVJEYNCkq3j4wLQfWyw+PmT8MVeseWdUi+qmNev9D+
 +W/iWnXbqaGcgVtJdMZMrxQyYLxqjafLYySNiZ/MwzMgvBhmdq6tG5UfesAS7AyO5R
 qqDUTDg7wzazVZQcmk59bsDkK1Nkx4/tnjJITnlVwkAhR86+UbBTRDFr573dzbP2/F
 8keJKajePiTJw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 18 May 2023 16:34:21 +0800
Message-Id: <20230518083421.2242787-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As JuHyung reported in [1]: "In most consumer-grade blackbox
 SSDs, device-side GCs are handled automatically for various workloads. f2fs,
 however, leaves that responsibility to the userspace with conservative tuning
 on the kerne [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzZ63-0002SI-T4
Subject: [f2fs-dev] [PATCH v2] f2fs: support background_gc=adjust mount
 option
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QXMgSnVIeXVuZyByZXBvcnRlZCBpbiBbMV06CgoiSW4gbW9zdCBjb25zdW1lci1ncmFkZSBibGFj
a2JveCBTU0RzLCBkZXZpY2Utc2lkZSBHQ3MgYXJlIGhhbmRsZWQKYXV0b21hdGljYWxseSBmb3Ig
dmFyaW91cyB3b3JrbG9hZHMuIGYyZnMsIGhvd2V2ZXIsIGxlYXZlcyB0aGF0CnJlc3BvbnNpYmls
aXR5IHRvIHRoZSB1c2Vyc3BhY2Ugd2l0aCBjb25zZXJ2YXRpdmUgdHVuaW5nIG9uIHRoZQprZXJu
ZWwtc2lkZSBieSBkZWZhdWx0LiBBbmRyb2lkIGhhbmRsZXMgdGhpcyBieSBpbml0LnJjIHR1bmlu
Z3MgYW5kIGEKc2VwYXJhdGUgY29kZSBydW5uaW5nIGluIHZvbGQgdG8gdHJpZ2dlciBnY191cmdl
bnQuCgpGb3IgcmVndWxhciBMaW51eCBkZXNrdG9wIGRpc3Ryb3MsIGYyZnMganVzdCBydW5zIG9u
IHRoZSBkZWZhdWx0CmNvbmZpZ3VyYXRpb24gc2V0IG9uIHRoZSBrZXJuZWwgYW5kIHVubGVzcyBp
dOKAmXMgcnVubmluZyAyNC83IHdpdGgKcGxlbnRpZnVsIGlkbGUgdGltZSwgaXQgcXVpY2tseSBy
dW5zIG91dCBvZiBmcmVlIHNlZ21lbnRzIGFuZCBzdGFydHMKdHJpZ2dlcmluZyBmb3JlZ3JvdW5k
IEdDLiBUaGlzIGlzIGdpdmluZyBwZW9wbGUgdGhlIHdyb25nIGltcHJlc3Npb24KdGhhdCBmMmZz
IHNsb3dzIGRvd24gZmFyIGRyYXN0aWNhbGx5IHRoYW4gb3RoZXIgZmlsZS1zeXN0ZW1zIHdoZW4K
dGhhdOKAmXMgcXVpdGUgdGhlIGNvbnRyYXJ5IChpLmUuLCBsZXNzIGZyYWdtZW50YXRpb24gb3Zl
cnRpbWUpLiIKClRoaXMgcGF0Y2ggc3VwcG9ydHMgYmFja2dyb3VuZF9nYz1hZGp1c3QgbW91bnQg
b3B0aW9uLgoKSWYgYmFja2dyb3VuZF9nYz1hZGp1c3QsIGdjIHdpbGwgYWRqdXN0IGl0cyBwb2xp
Y3kgZGVwZW5kcwpvbiBjb25kaXRpb25zOiBzcGVlZCB1cCBpZiB0aGVyZSBubyBmcmVlIHNlZ21l
bnRzLCBhbmQgc2xvdwpkb3duIGlmIHRoZXJlIGlzIG5vIGZyZWUgc3BhY2UuCgpUaGUgbWFpbiBs
b2dpYyBpcyBhcyBiZWxvdzoKCjEuIHBlcmZvcm1hbmNlIG1vZGUKLSBjb25kaXRpb246IGlmIGZy
ZWVfc2VnbWVudHMgaXMgbGVzcyB0aGFuIDEwICogb3ZwX3NlZ21lbnRzIGFuZApyZWNsYWltYWJs
ZV9ibG9jayBpcyBtb3JlIHRoYW4gMjAgKiB1bnVzZWRfdXNlcl9ibG9jawotIGFjdGlvbjoKIGEp
IHJlZHVjZSBzbGVlcCB0aW1lIG9mIEdDIHRocmVhZCBiYXNlZCBvbiBmcmVlIHVzZXIgYmxvY2sK
ICAgIHJhdGlvLCB0aGF0IGlzIHRvIHNheSwgdGhlIG1vcmUgcmVjbGFpbWFibGUgYmxvY2tzLCB0
aGUgbGVzcyB0aW1lCiAgICB0aHJlYWQgd2lsbCBzbGVlcAogYikgZGlzYWJsZSBJTyBhd2FyZQoK
Mi4gbGlmZXRpbWUgbW9kZToKLSBjb25kaXRpb246IGlmIGZyZWUgc3BhY2UgaXMgbGVzcyB0aGFu
IDkwJQotIGFjdGlvbjoKIGEpIHJlc2V0IG1pbl9zbGVlcF90aW1lIHRvIGRlZmF1bHQgMzAwMDAg
bXMKIGIpIHJlZHVjZSBjb3N0IHdlaWdodCBvZiBhZ2Ugd2hlbiBjYWNsdWF0aW5nIGNvc3Qgb2Yg
ZGlydHkKIHNlZ21lbnQsIHNvIHRoYXQgR0MgbWF5IHNlbGVjdCB2aWN0aW0gd2hpY2ggY29udGFp
bnMgbGVzcyBibG9ja3MKIGMpIGRpc2FibGUgSU8gYXdhcmUKCjMuIGJhbGFuY2UgbW9kZQotIGNv
bmRpdGlvbjogaXQgaXMgZGVmYXVsdCBtb2RlCi0gYWN0aW9uOgogYSkgcmVkdWNlIG1pbl9zbGVl
cF90aW1lIGZyb20gMzAwMDAgbXMgdG8gMTAwMDAgbXMKIGIpIGVuYWJsZSBJTyBhd2FyZQoKWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvQ0FEMTQrZjN6PWtTOUUr
TlRLSDd0MUoyeEwxUHBMT1ZNTng9Q2FiRF90Mks2VT1UOXVRQG1haWwuZ21haWwuY29tCgpPcmln
aW5hbCBwYXRjaCB3YXMgZGV2ZWxvcGVkIGJ5IFdlaWNoYW8gR3VvLCBJIHJlZmFjdG9yIGl0IGEg
Yml0IGFuZApyZWJhc2UgdGhlIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBXZWljaGFvIEd1byA8Z3Vv
d2VpY2hhb0BvcHBvLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PgotLS0KdjI6Ci0gZml4IHR5cG8KLSBkaXNhYmxlIElPIGF3YXJlIGZvciBwZXJmL2xpZmV0aW1l
IG1vZGUKLSBjaGVjayBiZ2djIG1vZGUgaW4gZ2V0X21heF9hZ2UoKQogRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy9mMmZzLnJzdCB8ICA3ICsrLQogZnMvZjJmcy9mMmZzLmggICAgICAgICAgICAg
ICAgICAgICB8ICA0ICsrCiBmcy9mMmZzL2djLmMgICAgICAgICAgICAgICAgICAgICAgIHwgOTQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiBmcy9mMmZzL2djLmggICAgICAgICAgICAg
ICAgICAgICAgIHwgMjMgKysrKysrKysKIGZzL2YyZnMvc3VwZXIuYyAgICAgICAgICAgICAgICAg
ICAgfCAgNCArKwogNSBmaWxlcyBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IGIv
RG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdAppbmRleCA5MzU5OTc4YTVhZjIuLjc2
NDMwMWY3MzkxZSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJz
dAorKysgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0CkBAIC0xMTIsOCArMTEy
LDExIEBAIGJhY2tncm91bmRfZ2M9JXMJIFR1cm4gb24vb2ZmIGNsZWFuaW5nIG9wZXJhdGlvbnMs
IG5hbWVseSBnYXJiYWdlCiAJCQkgY29sbGVjdGlvbiBhbmQgaWYgYmFja2dyb3VuZF9nYz1vZmYs
IGdhcmJhZ2UgY29sbGVjdGlvbgogCQkJIHdpbGwgYmUgdHVybmVkIG9mZi4gSWYgYmFja2dyb3Vu
ZF9nYz1zeW5jLCBpdCB3aWxsIHR1cm4KIAkJCSBvbiBzeW5jaHJvbm91cyBnYXJiYWdlIGNvbGxl
Y3Rpb24gcnVubmluZyBpbiBiYWNrZ3JvdW5kLgotCQkJIERlZmF1bHQgdmFsdWUgZm9yIHRoaXMg
b3B0aW9uIGlzIG9uLiBTbyBnYXJiYWdlCi0JCQkgY29sbGVjdGlvbiBpcyBvbiBieSBkZWZhdWx0
LgorCQkJIElmIGJhY2tncm91bmRfZ2M9YWRqdXN0LCBnYyB3aWxsIGFkanVzdCBpdHMgcG9saWN5
IGRlcGVuZHMKKwkJCSBvbiBjb25kaXRpb25zOiBzcGVlZCB1cCBpZiB0aGVyZSBubyBmcmVlIHNl
Z21lbnRzLCBhbmQgc2xvdworCQkJIGRvd24gaWYgdGhlcmUgaXMgbm8gZnJlZSBzcGFjZS4KKwkJ
CSBEZWZhdWx0IHZhbHVlIGZvciB0aGlzIG9wdGlvbiBpcyBvbi4gU28gZ2FyYmFnZSBjb2xsZWN0
aW9uCisJCQkgaXMgb24gYnkgZGVmYXVsdC4KIGdjX21lcmdlCQkgV2hlbiBiYWNrZ3JvdW5kX2dj
IGlzIG9uLCB0aGlzIG9wdGlvbiBjYW4gYmUgZW5hYmxlZCB0bwogCQkJIGxldCBiYWNrZ3JvdW5k
IEdDIHRocmVhZCB0byBoYW5kbGUgZm9yZWdyb3VuZCBHQyByZXF1ZXN0cywKIAkJCSBpdCBjYW4g
ZWxpbWluYXRlIHRoZSBzbHVnZ2lzaCBpc3N1ZSBjYXVzZWQgYnkgc2xvdyBmb3JlZ3JvdW5kCmRp
ZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCmluZGV4IDhkNGVhZjRk
MjI0Ni4uZTgyYWY4YTA5ZDExIDEwMDY0NAotLS0gYS9mcy9mMmZzL2YyZnMuaAorKysgYi9mcy9m
MmZzL2YyZnMuaApAQCAtMTMzMyw2ICsxMzMzLDEwIEBAIGVudW0gewogCQkJCSAqIGJhY2tncm91
bmQgZ2MgaXMgb24sIG1pZ3JhdGluZyBibG9ja3MKIAkJCQkgKiBsaWtlIGZvcmVncm91bmQgZ2MK
IAkJCQkgKi8KKwlCR0dDX01PREVfQURKVVNULAkvKgorCQkJCSAqIGJhY2tncm91bmQgZ2MgaXMg
b24sIGFuZCB0dW5lIGl0cyBzcGVlZAorCQkJCSAqIGRlcGVuZHMgb24gY29uZGl0aW9ucworCQkJ
CSAqLwogfTsKIAogZW51bSB7CmRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2dj
LmMKaW5kZXggNTFkN2U4ZDI5YmYxLi4zNWI5NWIzZDU3ZWYgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMv
Z2MuYworKysgYi9mcy9mMmZzL2djLmMKQEAgLTI4LDYgKzI4LDY3IEBAIHN0YXRpYyBzdHJ1Y3Qg
a21lbV9jYWNoZSAqdmljdGltX2VudHJ5X3NsYWI7CiBzdGF0aWMgdW5zaWduZWQgaW50IGNvdW50
X2JpdHMoY29uc3QgdW5zaWduZWQgbG9uZyAqYWRkciwKIAkJCQl1bnNpZ25lZCBpbnQgb2Zmc2V0
LCB1bnNpZ25lZCBpbnQgbGVuKTsKIAorc3RhdGljIGlubGluZSBpbnQgZnJlZV91c2VyX2Jsb2Nr
X3JhdGlvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKK3sKKwlibG9ja190IHVudXNlZF91c2Vy
X2Jsb2NrcyA9IHNiaS0+dXNlcl9ibG9ja19jb3VudCAtCisJCQkJCXdyaXR0ZW5fYmxvY2tfY291
bnQoc2JpKTsKKwlyZXR1cm4gdW51c2VkX3VzZXJfYmxvY2tzID09IDAgPyAxMDAgOgorCQkoMTAw
ICogZnJlZV91c2VyX2Jsb2NrcyhzYmkpIC8gdW51c2VkX3VzZXJfYmxvY2tzKTsKK30KKworc3Rh
dGljIGJvb2wgaGFzX2Zld19mcmVlX3NlZ21lbnRzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkK
K3sKKwl1bnNpZ25lZCBpbnQgZnJlZV9zZWdzID0gZnJlZV9zZWdtZW50cyhzYmkpOworCXVuc2ln
bmVkIGludCBvdnBfc2VncyA9IG92ZXJwcm92aXNpb25fc2VnbWVudHMoc2JpKTsKKworCXJldHVy
biBmcmVlX3NlZ3MgPD0gREVGX0ZFV19GUkVFX1NFR01FTlRfTVVMVElQTEUgKiBvdnBfc2VnczsK
K30KKworc3RhdGljIGJvb2wgaGFzX2Zld19mcmVlX3NwYWNlKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSkKK3sKKwlibG9ja190IHRvdGFsX3VzZXJfYmxvY2sgPSBzYmktPnVzZXJfYmxvY2tfY291
bnQ7CisJYmxvY2tfdCBmcmVlX3VzZXJfYmxvY2tzID0gdG90YWxfdXNlcl9ibG9jayAtIHdyaXR0
ZW5fYmxvY2tfY291bnQoc2JpKTsKKworCXJldHVybiAxMDAgKiBmcmVlX3VzZXJfYmxvY2tzIC8g
dG90YWxfdXNlcl9ibG9jayA8PQorCQkJCQlERUZfRkVXX0ZSRUVfU1BBQ0VfUkFUSU87Cit9CisK
K3N0YXRpYyBib29sIGhhc19lbm91Z2hfcmVjbGFpbWFibGVfYmxvY2tzKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSkKK3sKKwlyZXR1cm4gMTAwIC0gZnJlZV91c2VyX2Jsb2NrX3JhdGlvKHNiaSkg
Pj0KKwkJCURFRl9FTk9VR0hfUkVDTEFJTUFCTEVfQkxPQ0tfUkFUSU87Cit9CisKK3N0YXRpYyB2
b2lkIGFkanVzdF9nY19wZXJmZXJlbmNlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKKwkJCQkJ
CXVuc2lnbmVkIGludCAqd2FpdF9tcykKK3sKKwlzdHJ1Y3QgZjJmc19nY19rdGhyZWFkICpnY190
aCA9IHNiaS0+Z2NfdGhyZWFkOworCisJaWYgKGhhc19mZXdfZnJlZV9zcGFjZShzYmkpKQorCQln
Y190aC0+Z2NfcHJlZmVyZW5jZSA9IEdDX0xJRkVUSU1FX01PREU7CisJZWxzZSBpZiAoaGFzX2Zl
d19mcmVlX3NlZ21lbnRzKHNiaSkgJiYKKwkJCWhhc19lbm91Z2hfcmVjbGFpbWFibGVfYmxvY2tz
KHNiaSkpCisJCWdjX3RoLT5nY19wcmVmZXJlbmNlID0gR0NfUEVSRk9STUFOQ0VfTU9ERTsKKwll
bHNlCisJCWdjX3RoLT5nY19wcmVmZXJlbmNlID0gR0NfQkFMQU5DRV9NT0RFOworCisJc3dpdGNo
IChnY190aC0+Z2NfcHJlZmVyZW5jZSkgeworCWNhc2UgR0NfUEVSRk9STUFOQ0VfTU9ERToKKwkJ
KndhaXRfbXMgPSBtYXgoREVGX0dDX0JBTEFOQ0VfTUlOX1NMRUVQX1RJTUUgKgorCQkJCQlmcmVl
X3VzZXJfYmxvY2tfcmF0aW8oc2JpKSAvIDEwMCwKKwkJCQkJREVGX0dDX1BFUkZPUk1BTkNFX01J
Tl9TTEVFUF9USU1FKTsKKwkJYnJlYWs7CisJY2FzZSBHQ19MSUZFVElNRV9NT0RFOgorCQlnY190
aC0+bWluX3NsZWVwX3RpbWUgPSBERUZfR0NfVEhSRUFEX01JTl9TTEVFUF9USU1FOworCQlicmVh
azsKKwljYXNlIEdDX0JBTEFOQ0VfTU9ERToKKwkJZ2NfdGgtPm1pbl9zbGVlcF90aW1lID0gREVG
X0dDX0JBTEFOQ0VfTUlOX1NMRUVQX1RJTUU7CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCWYyZnNf
YnVnX29uKHNiaSwgMSk7CisJfQorfQorCiBzdGF0aWMgaW50IGdjX3RocmVhZF9mdW5jKHZvaWQg
KmRhdGEpCiB7CiAJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gZGF0YTsKQEAgLTQ2LDYgKzEw
Nyw5IEBAIHN0YXRpYyBpbnQgZ2NfdGhyZWFkX2Z1bmModm9pZCAqZGF0YSkKIAlkbyB7CiAJCWJv
b2wgc3luY19tb2RlLCBmb3JlZ3JvdW5kID0gZmFsc2U7CiAKKwkJaWYgKEYyRlNfT1BUSU9OKHNi
aSkuYmdnY19tb2RlID09IEJHR0NfTU9ERV9BREpVU1QpCisJCQlhZGp1c3RfZ2NfcGVyZmVyZW5j
ZShzYmksICZ3YWl0X21zKTsKKwogCQl3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgq
d3EsCiAJCQkJa3RocmVhZF9zaG91bGRfc3RvcCgpIHx8IGZyZWV6aW5nKGN1cnJlbnQpIHx8CiAJ
CQkJd2FpdHF1ZXVlX2FjdGl2ZShmZ2djX3dxKSB8fApAQCAtMTA5LDcgKzE3Myw5IEBAIHN0YXRp
YyBpbnQgZ2NfdGhyZWFkX2Z1bmModm9pZCAqZGF0YSkKIAkJCWdvdG8gbmV4dDsKIAkJfQogCi0J
CWlmICghaXNfaWRsZShzYmksIEdDX1RJTUUpKSB7CisJCWlmICghaXNfaWRsZShzYmksIEdDX1RJ
TUUpICYmCisJCQkoRjJGU19PUFRJT04oc2JpKS5iZ2djX21vZGUgIT0gQkdHQ19NT0RFX0FESlVT
VCB8fAorCQkJCWdjX3RoLT5nY19wcmVmZXJlbmNlID09IEdDX0JBTEFOQ0VfTU9ERSkpIHsKIAkJ
CWluY3JlYXNlX3NsZWVwX3RpbWUoZ2NfdGgsICZ3YWl0X21zKTsKIAkJCWYyZnNfdXBfd3JpdGUo
JnNiaS0+Z2NfbG9jayk7CiAJCQlzdGF0X2lvX3NraXBfYmdnY19jb3VudChzYmkpOwpAQCAtMTgz
LDYgKzI0OSw4IEBAIGludCBmMmZzX3N0YXJ0X2djX3RocmVhZChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpCiAJZ2NfdGgtPm1heF9zbGVlcF90aW1lID0gREVGX0dDX1RIUkVBRF9NQVhfU0xFRVBf
VElNRTsKIAlnY190aC0+bm9fZ2Nfc2xlZXBfdGltZSA9IERFRl9HQ19USFJFQURfTk9HQ19TTEVF
UF9USU1FOwogCisJZ2NfdGgtPmdjX3ByZWZlcmVuY2UgPSBHQ19CQUxBTkNFX01PREU7CisKIAln
Y190aC0+Z2Nfd2FrZSA9IGZhbHNlOwogCiAJc2JpLT5nY190aHJlYWQgPSBnY190aDsKQEAgLTMy
OSw2ICszOTcsMjQgQEAgc3RhdGljIHVuc2lnbmVkIGludCBjaGVja19iZ192aWN0aW1zKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSkKIAlyZXR1cm4gTlVMTF9TRUdOTzsKIH0KIAorc3RhdGljIHVu
c2lnbmVkIGNoYXIgZ2V0X21heF9hZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQoreworCXN0
cnVjdCBmMmZzX2djX2t0aHJlYWQgKmdjX3RoID0gc2JpLT5nY190aHJlYWQ7CisJdW5zaWduZWQg
Y2hhciBtYXhfYWdlID0gMTAwOworCXVuc2lnbmVkIGNoYXIgcmF0aW87CisKKwlpZiAoIWdjX3Ro
IHx8IEYyRlNfT1BUSU9OKHNiaSkuYmdnY19tb2RlICE9IEJHR0NfTU9ERV9BREpVU1QgfHwKKwkJ
CWdjX3RoLT5nY19wcmVmZXJlbmNlICE9IEdDX0xJRkVUSU1FX01PREUpCisJCWdvdG8gb3V0Owor
CisJLyogaWYgZnJlZSBibG9jayBjb3VudCBpcyBsZXNzIHRoYW4gMTAlLCByZWR1Y2UgY29zdCB3
ZWlnaHQgb2YgYWdlICovCisJcmF0aW8gPSBmcmVlX3VzZXJfYmxvY2tfcmF0aW8oc2JpKTsKKwlp
ZiAocmF0aW8gPD0gREVGX0ZFV19GUkVFX1NFR01FTlRfUkFUSU8pCisJCW1heF9hZ2UgPSBtYXgo
MTAgKiByYXRpbywgMSk7CitvdXQ6CisJcmV0dXJuIG1heF9hZ2U7Cit9CisKIHN0YXRpYyB1bnNp
Z25lZCBpbnQgZ2V0X2NiX2Nvc3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBp
bnQgc2Vnbm8pCiB7CiAJc3RydWN0IHNpdF9pbmZvICpzaXRfaSA9IFNJVF9JKHNiaSk7CkBAIC0z
MzYsNiArNDIyLDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCBnZXRfY2JfY29zdChzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCBzZWdubykKIAl1bnNpZ25lZCBpbnQgc3RhcnQg
PSBHRVRfU0VHX0ZST01fU0VDKHNiaSwgc2Vjbm8pOwogCXVuc2lnbmVkIGxvbmcgbG9uZyBtdGlt
ZSA9IDA7CiAJdW5zaWduZWQgaW50IHZibG9ja3M7CisJdW5zaWduZWQgY2hhciBtYXhfYWdlOwog
CXVuc2lnbmVkIGNoYXIgYWdlID0gMDsKIAl1bnNpZ25lZCBjaGFyIHU7CiAJdW5zaWduZWQgaW50
IGk7CkBAIC0zNTUsOCArNDQyLDExIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgZ2V0X2NiX2Nvc3Qo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgc2Vnbm8pCiAJCXNpdF9pLT5t
aW5fbXRpbWUgPSBtdGltZTsKIAlpZiAobXRpbWUgPiBzaXRfaS0+bWF4X210aW1lKQogCQlzaXRf
aS0+bWF4X210aW1lID0gbXRpbWU7CisKKwltYXhfYWdlID0gZ2V0X21heF9hZ2Uoc2JpKTsKKwog
CWlmIChzaXRfaS0+bWF4X210aW1lICE9IHNpdF9pLT5taW5fbXRpbWUpCi0JCWFnZSA9IDEwMCAt
IGRpdjY0X3U2NCgxMDAgKiAobXRpbWUgLSBzaXRfaS0+bWluX210aW1lKSwKKwkJYWdlID0gbWF4
X2FnZSAtIGRpdjY0X3U2NChtYXhfYWdlICogKG10aW1lIC0gc2l0X2ktPm1pbl9tdGltZSksCiAJ
CQkJc2l0X2ktPm1heF9tdGltZSAtIHNpdF9pLT5taW5fbXRpbWUpOwogCiAJcmV0dXJuIFVJTlRf
TUFYIC0gKCgxMDAgKiAoMTAwIC0gdSkgKiBhZ2UpIC8gKDEwMCArIHUpKTsKZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZ2MuaCBiL2ZzL2YyZnMvZ2MuaAppbmRleCAyOGEwMDk0MjgwMmMuLjY2ZjZhMzBk
ZDQ5NCAxMDA2NDQKLS0tIGEvZnMvZjJmcy9nYy5oCisrKyBiL2ZzL2YyZnMvZ2MuaApAQCAtMTUs
NiArMTUsMTQgQEAKICNkZWZpbmUgREVGX0dDX1RIUkVBRF9NQVhfU0xFRVBfVElNRQk2MDAwMAog
I2RlZmluZSBERUZfR0NfVEhSRUFEX05PR0NfU0xFRVBfVElNRQkzMDAwMDAJLyogd2FpdCA1IG1p
biAqLwogCisvKiBmb3IgQkdHQ19NT0RFX0FESlVTVCAqLworI2RlZmluZSBERUZfR0NfUEVSRk9S
TUFOQ0VfTUlOX1NMRUVQX1RJTUUJMTAwCS8qIDEwMCBtcyAqLworI2RlZmluZSBERUZfR0NfQkFM
QU5DRV9NSU5fU0xFRVBfVElNRQkJMTAwMDAJLyogMTAgc2VjICovCisjZGVmaW5lIERFRl9GRVdf
RlJFRV9TUEFDRV9SQVRJTwkJMTAJLyogZmV3IGZyZWUgc3BhY2UgcmF0aW8gKi8KKyNkZWZpbmUg
REVGX0ZFV19GUkVFX1NFR01FTlRfTVVMVElQTEUJCTEwCS8qIGZldyBmcmVlIHNlZ21lbnRzIG11
bHRpcGxlICovCisjZGVmaW5lIERFRl9FTk9VR0hfUkVDTEFJTUFCTEVfQkxPQ0tfUkFUSU8JMjAJ
LyogZW5vdWdoIHJlY2xhaW1hYmxlIGJsb2NrIHJhdGlvICovCisjZGVmaW5lIERFRl9GRVdfRlJF
RV9TRUdNRU5UX1JBVElPCQkxMAkvKiBmZXcgZnJlZSBzZWdtZW50IHJhdGlvICovCisKIC8qIGNo
b29zZSBjYW5kaWRhdGVzIGZyb20gc2VjdGlvbnMgd2hpY2ggaGFzIGFnZSBvZiBtb3JlIHRoYW4g
NyBkYXlzICovCiAjZGVmaW5lIERFRl9HQ19USFJFQURfQUdFX1RIUkVTSE9MRAkJKDYwICogNjAg
KiAyNCAqIDcpCiAjZGVmaW5lIERFRl9HQ19USFJFQURfQ0FORElEQVRFX1JBVElPCQkyMAkvKiBz
ZWxlY3QgMjAlIG9sZGVzdCBzZWN0aW9ucyBhcyBjYW5kaWRhdGVzICovCkBAIC0zMiw2ICs0MCwx
OSBAQAogCiAjZGVmaW5lIE5SX0dDX0NIRUNLUE9JTlRfU0VDUyAoMykJLyogZGF0YS9ub2RlL2Rl
bnRyeSBzZWN0aW9ucyAqLwogCisvKiBHQyBwcmVmZXJlbmNlICovCitlbnVtIHsKKwlHQ19QRVJG
T1JNQU5DRV9NT0RFLAkJLyoKKwkJCQkJICogc3BlZWQgdXAgYmFja2dyb3VuZCBnYyB0byByZWN5
Y2xlCisJCQkJCSAqIHNsYWNrIHNwYWNlIGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UKKwkJCQkJICov
CisJR0NfTElGRVRJTUVfTU9ERSwJCS8qCisJCQkJCSAqIHNsb3cgZG93biBiYWNrZ3JvdW5kIGdj
IHRvIGF2b2lkIGhpZ2gKKwkJCQkJICogV0FGIGlmIHRoZXJlIGlzIGxlc3MgZnJlZSBzcGFjZS4K
KwkJCQkJICovCisJR0NfQkFMQU5DRV9NT0RFLAkJLyogdHJhZGVvZmYgaW4gYmV0d2VlbiBwZXJm
IGFuZCBsaWZldGltZSAqLworfTsKKwogc3RydWN0IGYyZnNfZ2Nfa3RocmVhZCB7CiAJc3RydWN0
IHRhc2tfc3RydWN0ICpmMmZzX2djX3Rhc2s7CiAJd2FpdF9xdWV1ZV9oZWFkX3QgZ2Nfd2FpdF9x
dWV1ZV9oZWFkOwpAQCAtNDIsNiArNjMsOCBAQCBzdHJ1Y3QgZjJmc19nY19rdGhyZWFkIHsKIAl1
bnNpZ25lZCBpbnQgbWF4X3NsZWVwX3RpbWU7CiAJdW5zaWduZWQgaW50IG5vX2djX3NsZWVwX3Rp
bWU7CiAKKwl1bnNpZ25lZCBjaGFyIGdjX3ByZWZlcmVuY2U7CS8qIGdjIHBlcmZlcmVuY2UgKi8K
KwogCS8qIGZvciBjaGFuZ2luZyBnYyBtb2RlICovCiAJYm9vbCBnY193YWtlOwogCmRpZmYgLS1n
aXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKaW5kZXggZjE5MjE3MjE5YzNi
Li44MDZjODExOWYwMjEgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvc3VwZXIuYworKysgYi9mcy9mMmZz
L3N1cGVyLmMKQEAgLTY5Myw2ICs2OTMsOCBAQCBzdGF0aWMgaW50IHBhcnNlX29wdGlvbnMoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYiwgY2hhciAqb3B0aW9ucywgYm9vbCBpc19yZW1vdW50KQogCQkJ
CUYyRlNfT1BUSU9OKHNiaSkuYmdnY19tb2RlID0gQkdHQ19NT0RFX09GRjsKIAkJCX0gZWxzZSBp
ZiAoIXN0cmNtcChuYW1lLCAic3luYyIpKSB7CiAJCQkJRjJGU19PUFRJT04oc2JpKS5iZ2djX21v
ZGUgPSBCR0dDX01PREVfU1lOQzsKKwkJCX0gZWxzZSBpZiAoIXN0cmNtcChuYW1lLCAiYWRqdXN0
IikpIHsKKwkJCQlGMkZTX09QVElPTihzYmkpLmJnZ2NfbW9kZSA9IEJHR0NfTU9ERV9BREpVU1Q7
CiAJCQl9IGVsc2UgewogCQkJCWtmcmVlKG5hbWUpOwogCQkJCXJldHVybiAtRUlOVkFMOwpAQCAt
MTkyNyw2ICsxOTI5LDggQEAgc3RhdGljIGludCBmMmZzX3Nob3dfb3B0aW9ucyhzdHJ1Y3Qgc2Vx
X2ZpbGUgKnNlcSwgc3RydWN0IGRlbnRyeSAqcm9vdCkKIAkJc2VxX3ByaW50ZihzZXEsICIsYmFj
a2dyb3VuZF9nYz0lcyIsICJvbiIpOwogCWVsc2UgaWYgKEYyRlNfT1BUSU9OKHNiaSkuYmdnY19t
b2RlID09IEJHR0NfTU9ERV9PRkYpCiAJCXNlcV9wcmludGYoc2VxLCAiLGJhY2tncm91bmRfZ2M9
JXMiLCAib2ZmIik7CisJZWxzZSBpZiAoRjJGU19PUFRJT04oc2JpKS5iZ2djX21vZGUgPT0gQkdH
Q19NT0RFX0FESlVTVCkKKwkJc2VxX3ByaW50ZihzZXEsICIsYmFja2dyb3VuZF9nYz0lcyIsICJh
ZGp1c3QiKTsKIAogCWlmICh0ZXN0X29wdChzYmksIEdDX01FUkdFKSkKIAkJc2VxX3B1dHMoc2Vx
LCAiLGdjX21lcmdlIik7Ci0tIAoyLjQwLjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
