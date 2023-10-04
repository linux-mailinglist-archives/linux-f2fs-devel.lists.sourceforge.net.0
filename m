Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FAE7B98F7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Oct 2023 01:55:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qoBi9-0006Gc-JZ;
	Wed, 04 Oct 2023 23:55:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qoBi8-0006GV-2C
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Oct 2023 23:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wmPE5iob7bk3p1cKLkyfjcpW9xx2S3XtCsKr+fqVHHo=; b=dd/mC+jLcJCapoDOjRwUmFJFtd
 KZOsaaKxueZl7UyJpf4rfJLVWNXP1+w7WeKqdGpW17Sa9bhrmyBL9mxLnrw68McYGmhaKVp81YEiY
 LrvtcEcIfAkntHj/YRXrl5AvnXGoUU9p2/H0JxZ1WuSghZseBGUU2nMxpUgQnug2JWaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wmPE5iob7bk3p1cKLkyfjcpW9xx2S3XtCsKr+fqVHHo=; b=SLOUEk4yB89o46CkSp9BlB9bkW
 1DXj565LCbdg02HsLB9Uyb9+WXytTNVwvyL48uEAHOPZ1B45hD4HSdJOnLZ1TTl1//LhCEDlTVPqu
 BOU5mSMZmgD1YvySrJUVlg2/GAuJC5a6SBu2L3scPMOu7wIQ23adShIqbAyVJbP5dcug=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qoBi4-001uuH-2L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Oct 2023 23:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C8EC8B8220B;
 Wed,  4 Oct 2023 23:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508CFC433C8;
 Wed,  4 Oct 2023 23:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696463713;
 bh=MleeiaAqgiqyp0slPvMHrGbe3LZ4PVPcbqFmsHInq1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WUQD1uhqJdbp1DL+fDexe55XPnUwjMyjzExEYA+GaYLbjw6SHhgsFT9hnSPlkC/di
 YW8nF+JawSZvij+OiIl3fG7apa9tiD2+oLap4G/YTb1kGB5OuF52SiMjmCEr9+yJ74
 FlC3c4aeglAI0kdXWXgeraz4irl450EfQiXIRaP6aStqvu+z9d89V+g2cdVhIP//T8
 XgZYMOxd5q2NynxP8rtIlU65lCtktJloBTeNjsys+87aTFVVCvz+8IRWkc22Do8m0a
 9c4Sl9g/n1znh91amC12ApHZKPsVu36L+M7NEb/okTXd4Fq+whtORudeKkWDO4Wihi
 cIoh9TZX7sBDA==
Date: Wed, 4 Oct 2023 16:55:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <ZR37Xyr9HcVuLqxx@google.com>
References: <20231003230155.355807-1-daeho43@gmail.com>
 <ZR30mNQEyRjzr0jm@google.com>
 <CACOAw_zSvAPTREb0dSv6srRuxuKxDZp4rMhLyWTk+uJ3WKSWKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zSvAPTREb0dSv6srRuxuKxDZp4rMhLyWTk+uJ3WKSWKA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 10/04, Daeho Jeong wrote: > On Wed, Oct 4, 2023 at 4:26 PM
    Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > On 10/03, Daeho Jeong wrote:
    > > > From: Daeho Jeong <daehojeong@google.com> > > > > > > [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qoBi4-001uuH-2L
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: use proper address entry count
 for direct nodes
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMDQsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgNDoy
NuKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IDEwLzAzLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPiA+ID4KPiA+ID4gRm9yIGRpcmVjdCBub2Rlcywgd2UgaGF2ZSB0
byB1c2UgREVGX0FERFJTX1BFUl9CTE9DSy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFl
aG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBmc2NrL2Zz
Y2suYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZnNjay9mc2NrLmMgYi9mc2NrL2ZzY2su
Ywo+ID4gPiBpbmRleCA3OGZmZGI2Li41NmE3ZDMxIDEwMDY0NAo+ID4gPiAtLS0gYS9mc2NrL2Zz
Y2suYwo+ID4gPiArKysgYi9mc2NrL2ZzY2suYwo+ID4gPiBAQCAtMjg5NCw3ICsyODk0LDcgQEAg
c3RhdGljIHZvaWQgZnNja19mYWlsZWRfcmVjb25uZWN0X2ZpbGVfZG5vZGUoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLAo+ID4gPiAgICAgICBmc2NrLT5jaGsudmFsaWRfYmxrX2NudC0tOwo+ID4g
PiAgICAgICBmMmZzX2NsZWFyX21haW5fYml0bWFwKHNiaSwgbmkuYmxrX2FkZHIpOwo+ID4gPgo+
ID4gPiAtICAgICBmb3IgKGkgPSAwOyBpIDwgQUREUlNfUEVSX0JMT0NLKCZub2RlLT5pKTsgaSsr
KSB7Cj4gPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBERUZfQUREUlNfUEVSX0JMT0NLOyBpKysp
IHsKPiA+Cj4gPiBJdCBzZWVtcyB3ZSBuZWVkIHRvIHVzZSB0aGUgaW5vZGUgYmxvY2sgcGFzc2lu
ZyBieSBmc2NrX2ZhaWxlZF9yZWNvbm5lY3RfZmlsZSgpLgo+IAo+IFRoaXMgZnVuY3Rpb24gaXMg
Zm9yIGRpcmVjdCBub2Rlcy4gSXMgaXQgY29ycmVjdCB0byB1c2UgaW5vZGUgYmxvY2sgaGVyZT8K
CiA1MjMgdW5zaWduZWQgaW50IGFkZHJzX3Blcl9ibG9jayhzdHJ1Y3QgZjJmc19pbm9kZSAqaSkK
IDUyNCB7CiA1MjUgICAgICAgICBpZiAoIUxJTlVYX1NfSVNSRUcobGUxNl90b19jcHUoaS0+aV9t
b2RlKSkgfHwKIDUyNiAgICAgICAgICAgICAgICAgICAgICAgICAhKGxlMzJfdG9fY3B1KGktPmlf
ZmxhZ3MpICYgRjJGU19DT01QUl9GTCkpCiA1MjcgICAgICAgICAgICAgICAgIHJldHVybiBERUZf
QUREUlNfUEVSX0JMT0NLOwogNTI4ICAgICAgICAgcmV0dXJuIEFMSUdOX0RPV04oREVGX0FERFJT
X1BFUl9CTE9DSywgMSA8PCBpLT5pX2xvZ19jbHVzdGVyX3NpemUpOwogNTI5IH0KCklmIHRoZSBp
bm9kZSBpcyBjb21wcmVzc2VkLCBpdCBzZWVtcyBpdCBoYXMgdG8gYmUgYWxpZ25lZCB0byBjbHVz
dGVyIHNpemUuCgo+IAo+ID4KPiA+ID4gICAgICAgICAgICAgICBhZGRyID0gbGUzMl90b19jcHUo
bm9kZS0+ZG4uYWRkcltpXSk7Cj4gPiA+ICAgICAgICAgICAgICAgaWYgKCFhZGRyKQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPgo+ID4gMzAxMiAgICAgICAgICAgICAg
ICAgICAgICAgICBmc2NrLT5jaGsudmFsaWRfYmxrX2NudC0tOwo+ID4gMzAxMyAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoYWRkciA9PSBORVdfQUREUikKPiA+Cj4gPiBBbmQsIHdlIGFsc28g
bmVlZCB0byBza2lwIGlmIGFkZHIgPT0gQ09NUFJFU1NfQUREUiBoZXJlPwo+ID4KPiA+IDMwMTQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+IDMwMTUgICAgICAg
ICAgICAgICAgICAgICAgICAgZjJmc19jbGVhcl9tYWluX2JpdG1hcChzYmksIGFkZHIpOwo+ID4g
MzAxNiAgICAgICAgICAgICAgICAgfQo+ID4KPiA+ID4gLS0KPiA+ID4gMi40Mi4wLjU4Mi5nOGNj
ZDIwZDcwZC1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
