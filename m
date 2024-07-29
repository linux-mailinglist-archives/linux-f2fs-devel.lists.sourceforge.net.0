Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 200839401D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 01:50:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYa8P-0002s1-1K;
	Mon, 29 Jul 2024 23:50:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sYa8O-0002rt-0x
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 23:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MOOty64srAT27nSgp7NsCsuw7pKL1KLoQIr8DxUk94M=; b=WIbgBd2Ur5pvz95LbKzPR9bIm5
 4oJEbXXWZTr1g5I9xuF6xk8GCzSfX3CyL+GmSL8/2hnuPMpt4UB5XkVEErQqDIiebiKlXURW78rmc
 PGOjDxxk/SpGZqQbKBkGa2ToL+83HGzVzkE4Bq8stO8RWnPpnsNMiAoU9B4baWTVAPD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MOOty64srAT27nSgp7NsCsuw7pKL1KLoQIr8DxUk94M=; b=AqM59/9VfEWZOxNRioNn4NJQsS
 4FP3uV9HjENo/S52Qv9IhGK8xgi5kisxBhSgQ/8Y+AUy0kZpsbgbvnIRnCeOHmTxsaUjQ0E6PykWA
 lZIwnIu70W1EBunuC4MBa4P+DMBWRBwtwqN6rjibWKYNMGQhVLR9VxHJDbEhpZyUQKZ4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYa8N-0003t7-VY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jul 2024 23:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A91E61BB0;
 Mon, 29 Jul 2024 23:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B501C32786;
 Mon, 29 Jul 2024 23:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722297021;
 bh=LLa0JEbecfYxspdNADSQbGXOdx0jkKDHJFiDLxCz/FI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o3cyb4DcKZF64Bv7MeVQ307sx+Vy2bsWGj+Vv6pwg+s+3sb6G1mAxYHqrrFz9Gdnd
 Mlq5eSTchtuF5mIANne7gMivI3Ct23kQezGHJE5ldBLKG6ZXY1Yv6CQtyoi8Rhl8aj
 uR1DXtwcsgURCOU7QJv0zvZzfP3nGCiuYHjKj3uSf35wkeE2jfxbPcDSaUd/kinM0X
 LkZt2hkNgNSOsuO8qiRJAPo+s5qcCE3CmR434d3oNFtn0USlzOrZ+F+ER7kCt9/fj5
 rckssiEBTTkPDTPRH31n0XUazVhtbU90J1AclOl+Vv12CHr1PSeWp4WIqp8M87gAlq
 3sE0+VxRJ006Q==
Date: Mon, 29 Jul 2024 23:50:19 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zqgqu__whBrTMjUz@google.com>
References: <20240725183941.655356-1-jaegeuk@kernel.org>
 <CACOAw_xs63xqubrr9_vTR6-NU58LjHdbX1ZL_dJhLbtMnga-gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xs63xqubrr9_vTR6-NU58LjHdbX1ZL_dJhLbtMnga-gg@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 07/29, Daeho Jeong wrote: > On Thu, Jul 25, 2024 at 11:41 AM
    Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > Signed-off-by: Jaegeuk Kim
    <jaegeuk@kernel.org> > > --- > > fsck/inject.c | 28 +++++++ [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYa8N-0003t7-VY
Subject: Re: [f2fs-dev] [PATCH] inject.f2fs: fix some build errors
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDcvMjksIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFRodSwgSnVsIDI1LCAyMDI0IGF0IDEx
OjQx4oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiA+IC0tLQo+
ID4gIGZzY2svaW5qZWN0LmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9mc2NrL2luamVjdC5jIGIvZnNjay9pbmplY3QuYwo+ID4gaW5kZXggMmEy
MWRhZTI5M2Y2Li40ZmZkZmQwZjBiNWQgMTAwNjQ0Cj4gPiAtLS0gYS9mc2NrL2luamVjdC5jCj4g
PiArKysgYi9mc2NrL2luamVjdC5jCj4gPiBAQCAtMjExLDYgKzIxMSw4IEBAIGludCBpbmplY3Rf
cGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdLCBzdHJ1Y3QgaW5qZWN0X29wdGlv
biAqb3B0KQo+ID4KPiA+ICAgICAgICAgd2hpbGUgKChvID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJn
diwgb3B0aW9uX3N0cmluZywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9u
Z19vcHQsIE5VTEwpKSAhPSBFT0YpIHsKPiA+ICsgICAgICAgICAgICAgICBsb25nIG5pZCwgYmxr
Owo+ID4gKwo+ID4gICAgICAgICAgICAgICAgIHN3aXRjaCAobykgewo+ID4gICAgICAgICAgICAg
ICAgIGNhc2UgMToKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGMuZHJ5X3J1biA9IDE7Cj4g
PiBAQCAtMjY1LDEwICsyNjcsMTAgQEAgaW50IGluamVjdF9wYXJzZV9vcHRpb25zKGludCBhcmdj
LCBjaGFyICphcmd2W10sIHN0cnVjdCBpbmplY3Rfb3B0aW9uICpvcHQpCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBuYXQgcGFjayAlc1xuIiwgcGFja1tv
cHQtPm5hdF0pOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAg
ICAgICAgICAgY2FzZSA5Ogo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgb3B0LT5uaWQgPSBz
dHJ0b2wob3B0YXJnLCAmZW5kcHRyLCAwKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlm
IChvcHQtPm5pZCA9PSBMT05HX01BWCB8fCBvcHQtPm5pZCA9PSBMT05HX01JTiB8fAo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICplbmRwdHIgIT0gJ1wwJykKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIG5pZCA9IHN0cnRvbChvcHRhcmcsICZlbmRwdHIsIDApOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKG5pZCA+PSBVSU5UX01BWCB8fCAqZW5kcHRyICE9ICdcMCcp
Cj4gCj4gRG8gd2Ugc3VwcG9ydCBhIG5lZ2F0aXZlIHZhbHVlIGZvciBuaWQ/Cgp1bnNpZ25lZCBp
bnQ/Cgo+IAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVSQU5H
RTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG9wdC0+bmlkID0gbmlkOwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgTVNHKDAsICJJbmZvOiBpbmplY3QgbmlkICV1IDogMHgleFxuIiwg
b3B0LT5uaWQsIG9wdC0+bmlkKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ID4gICAgICAgICAgICAgICAgIGNhc2UgMTA6Cj4gPiBAQCAtMjgwLDEwICsyODIsMTAgQEAgaW50
IGluamVjdF9wYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICphcmd2W10sIHN0cnVjdCBpbmpl
Y3Rfb3B0aW9uICpvcHQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86
IGluamVjdCBzaXQgcGFjayAlc1xuIiwgcGFja1tvcHQtPnNpdF0pOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICAgICAgICAgY2FzZSAxMToKPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgIG9wdC0+YmxrID0gc3RydG9sKG9wdGFyZywgJmVuZHB0ciwgMCk7
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBpZiAob3B0LT5ibGsgPT0gTE9OR19NQVggfHwg
b3B0LT5ibGsgPT0gTE9OR19NSU4gfHwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAq
ZW5kcHRyICE9ICdcMCcpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBibGsgPSBzdHJ0b2wo
b3B0YXJnLCAmZW5kcHRyLCAwKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChibGsg
Pj0gVUlOVF9NQVggfHwgKmVuZHB0ciAhPSAnXDAnKQo+IAo+IGRpdHRvCj4gCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVJBTkdFOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgb3B0LT5ibGsgPSBibGs7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBN
U0coMCwgIkluZm86IGluamVjdCBibGthZGRyICV1IDogMHgleFxuIiwgb3B0LT5ibGssIG9wdC0+
YmxrKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICAgICAg
ICAgIGNhc2UgMTI6Cj4gPiBAQCAtNDMyLDcgKzQzNCw3IEBAIHN0YXRpYyBpbnQgaW5qZWN0X2Nw
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGluamVjdF9vcHRpb24gKm9wdCkKPiA+
ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgaWYgKCFzdHJjbXAob3B0LT5tYiwgImNoZWNrcG9p
bnRfdmVyIikpIHsKPiA+IC0gICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBjaGVj
a3BvaW50X3ZlciBvZiBjcCAlZDogMHglbGx4IC0+IDB4JWx4XG4iLAo+ID4gKyAgICAgICAgICAg
ICAgIE1TRygwLCAiSW5mbzogaW5qZWN0IGNoZWNrcG9pbnRfdmVyIG9mIGNwICVkOiAweCVsbHgg
LT4gMHglIlBSSXg2NCJcbiIsCj4gPiAgICAgICAgICAgICAgICAgICAgIG9wdC0+Y3AsIGdldF9j
cChjaGVja3BvaW50X3ZlciksICh1NjQpb3B0LT52YWwpOwo+ID4gICAgICAgICAgICAgICAgIHNl
dF9jcChjaGVja3BvaW50X3ZlciwgKHU2NClvcHQtPnZhbCk7Cj4gPiAgICAgICAgIH0gZWxzZSBp
ZiAoIXN0cmNtcChvcHQtPm1iLCAiY2twdF9mbGFncyIpKSB7Cj4gPiBAQCAtNTEwLDcgKzUxMiw3
IEBAIHN0YXRpYyBpbnQgaW5qZWN0X25hdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVj
dCBpbmplY3Rfb3B0aW9uICpvcHQpCj4gPiAgICAgICAgIGludCByZXQ7Cj4gPgo+ID4gICAgICAg
ICBpZiAoIUlTX1ZBTElEX05JRChzYmksIG9wdC0+bmlkKSkgewo+ID4gLSAgICAgICAgICAgICAg
IEVSUl9NU0coIkludmFsaWQgbmlkICV1IHJhbmdlIFsldTolbHVdXG4iLCBvcHQtPm5pZCwgMCwK
PiA+ICsgICAgICAgICAgICAgICBFUlJfTVNHKCJJbnZhbGlkIG5pZCAldSByYW5nZSBbJXU6JSJQ
Ukl1NjQiXVxuIiwgb3B0LT5uaWQsIDAsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBOQVRf
RU5UUllfUEVSX0JMT0NLICoKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICgoZ2V0X3NiKHNl
Z21lbnRfY291bnRfbmF0KSA8PCAxKSA8PAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHNi
aS0+bG9nX2Jsb2Nrc19wZXJfc2VnKSk7Cj4gPiBAQCAtNjI3LDcgKzYyOSw3IEBAIHN0YXRpYyBp
bnQgaW5qZWN0X3NpdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBpbmplY3Rfb3B0
aW9uICpvcHQpCj4gPiAgICAgICAgICAgICAgICAgc2l0LT52YWxpZF9tYXBbb3B0LT5pZHhdID0g
KHU4KW9wdC0+dmFsOwo+ID4gICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAob3B0LT5tYiwgIm10
aW1lIikpIHsKPiA+ICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGluamVjdCBzaXQgZW50
cnkgbXRpbWUgb2YgYmxvY2sgMHgleCAiCj4gPiAtICAgICAgICAgICAgICAgICAgICJpbiBwYWNr
ICVkOiAlbHUgLT4gJWx1XG4iLCBvcHQtPmJsaywgb3B0LT5zaXQsCj4gPiArICAgICAgICAgICAg
ICAgICAgICJpbiBwYWNrICVkOiAlIlBSSXU2NCIgLT4gJSJQUkl1NjQiXG4iLCBvcHQtPmJsaywg
b3B0LT5zaXQsCj4gPiAgICAgICAgICAgICAgICAgICAgIGxlNjRfdG9fY3B1KHNpdC0+bXRpbWUp
LCAodTY0KW9wdC0+dmFsKTsKPiA+ICAgICAgICAgICAgICAgICBzaXQtPm10aW1lID0gY3B1X3Rv
X2xlNjQoKHU2NClvcHQtPnZhbCk7Cj4gPiAgICAgICAgIH0gZWxzZSB7Cj4gPiBAQCAtNzUyLDEx
ICs3NTQsMTEgQEAgc3RhdGljIGludCBpbmplY3RfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBzdHJ1Y3QgZjJmc19ub2RlICpub2RlLAo+ID4gICAgICAgICAgICAgICAgICAgICBvcHQt
Pm5pZCwgbGUzMl90b19jcHUoaW5vZGUtPmlfbGlua3MpLCAodTMyKW9wdC0+dmFsKTsKPiA+ICAg
ICAgICAgICAgICAgICBpbm9kZS0+aV9saW5rcyA9IGNwdV90b19sZTMyKCh1MzIpb3B0LT52YWwp
Owo+ID4gICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAob3B0LT5tYiwgImlfc2l6ZSIpKSB7Cj4g
PiAtICAgICAgICAgICAgICAgTVNHKDAsICJJbmZvOiBpbmplY3QgaW5vZGUgaV9zaXplIG9mIG5p
ZCAldTogJWx1IC0+ICVsdVxuIiwKPiA+ICsgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IGlu
amVjdCBpbm9kZSBpX3NpemUgb2YgbmlkICV1OiAlIlBSSXU2NCIgLT4gJSJQUkl1NjQiXG4iLAo+
ID4gICAgICAgICAgICAgICAgICAgICBvcHQtPm5pZCwgbGU2NF90b19jcHUoaW5vZGUtPmlfc2l6
ZSksICh1NjQpb3B0LT52YWwpOwo+ID4gICAgICAgICAgICAgICAgIGlub2RlLT5pX3NpemUgPSBj
cHVfdG9fbGU2NCgodTY0KW9wdC0+dmFsKTsKPiA+ICAgICAgICAgfSBlbHNlIGlmICghc3RyY21w
KG9wdC0+bWIsICJpX2Jsb2NrcyIpKSB7Cj4gPiAtICAgICAgICAgICAgICAgTVNHKDAsICJJbmZv
OiBpbmplY3QgaW5vZGUgaV9ibG9ja3Mgb2YgbmlkICV1OiAlbHUgLT4gJWx1XG4iLAo+ID4gKyAg
ICAgICAgICAgICAgIE1TRygwLCAiSW5mbzogaW5qZWN0IGlub2RlIGlfYmxvY2tzIG9mIG5pZCAl
dTogJSJQUkl1NjQiIC0+ICUiUFJJdTY0IlxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgb3B0
LT5uaWQsIGxlNjRfdG9fY3B1KGlub2RlLT5pX2Jsb2NrcyksICh1NjQpb3B0LT52YWwpOwo+ID4g
ICAgICAgICAgICAgICAgIGlub2RlLT5pX2Jsb2NrcyA9IGNwdV90b19sZTY0KCh1NjQpb3B0LT52
YWwpOwo+ID4gICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAob3B0LT5tYiwgImlfZXh0cmFfaXNp
emUiKSkgewo+ID4gQEAgLTgzNSw3ICs4MzcsNyBAQCBzdGF0aWMgaW50IGluamVjdF9ub2RlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGluamVjdF9vcHRpb24gKm9wdCkKPiA+ICAg
ICAgICAgaW50IHJldDsKPiA+Cj4gPiAgICAgICAgIGlmICghSVNfVkFMSURfTklEKHNiaSwgb3B0
LT5uaWQpKSB7Cj4gPiAtICAgICAgICAgICAgICAgRVJSX01TRygiSW52YWxpZCBuaWQgJXUgcmFu
Z2UgWyV1OiVsdV1cbiIsIG9wdC0+bmlkLCAwLAo+ID4gKyAgICAgICAgICAgICAgIEVSUl9NU0co
IkludmFsaWQgbmlkICV1IHJhbmdlIFsldTolIlBSSXU2NCJdXG4iLCBvcHQtPm5pZCwgMCwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIE5BVF9FTlRSWV9QRVJfQkxPQ0sgKgo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgKChnZXRfc2Ioc2VnbWVudF9jb3VudF9uYXQpIDw8IDEpIDw8Cj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5sb2dfYmxvY2tzX3Blcl9zZWcpKTsKPiA+
IEBAIC04NjUsNyArODY3LDcgQEAgc3RhdGljIGludCBpbmplY3Rfbm9kZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIHN0cnVjdCBpbmplY3Rfb3B0aW9uICpvcHQpCj4gPiAgICAgICAgICAgICAg
ICAgZm9vdGVyLT5mbGFnID0gY3B1X3RvX2xlMzIoKHUzMilvcHQtPnZhbCk7Cj4gPiAgICAgICAg
IH0gZWxzZSBpZiAoIXN0cmNtcChvcHQtPm1iLCAiY3BfdmVyIikpIHsKPiA+ICAgICAgICAgICAg
ICAgICBNU0coMCwgIkluZm86IGluamVjdCBub2RlIGZvb3RlciBjcF92ZXIgb2YgbmlkICV1OiAi
Cj4gPiAtICAgICAgICAgICAgICAgICAgICIweCVseCAtPiAweCVseFxuIiwgb3B0LT5uaWQsIGxl
NjRfdG9fY3B1KGZvb3Rlci0+Y3BfdmVyKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgIjB4JSJQ
Ukl4NjQiIC0+IDB4JSJQUkl4NjQiXG4iLCBvcHQtPm5pZCwgbGU2NF90b19jcHUoZm9vdGVyLT5j
cF92ZXIpLAo+ID4gICAgICAgICAgICAgICAgICAgICAodTY0KW9wdC0+dmFsKTsKPiA+ICAgICAg
ICAgICAgICAgICBmb290ZXItPmNwX3ZlciA9IGNwdV90b19sZTY0KCh1NjQpb3B0LT52YWwpOwo+
ID4gICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAob3B0LT5tYiwgIm5leHRfYmxrYWRkciIpKSB7
Cj4gPiAtLQo+ID4gMi40Ni4wLnJjMS4yMzIuZzk3NTJmOWUxMjMtZ29vZwo+ID4KPiA+Cj4gPgo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
