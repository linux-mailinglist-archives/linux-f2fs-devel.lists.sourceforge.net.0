Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C75838683FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 23:48:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rejlH-00048p-Vb;
	Mon, 26 Feb 2024 22:47:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rejlG-00048g-99
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 22:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8lbptSU57JD2hlE6MWgKbuhahaE/sQ4zzkDcWOQfFpA=; b=fT00DyfdUAUcK5bDWbBIBqlFtK
 +brALYAK28MTd8nNJ/yhtspLlSPtjko/IS9HxjgjhH8Ba4rLJw3irwmQ7nBkpC5fVaI/+hyVwYBQT
 lUFryrf09+gGTj9ePlLtdmkebPd9Hb9xPKbPa5pQKraK/algUtJ2i0pHOnYWxONQOIQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8lbptSU57JD2hlE6MWgKbuhahaE/sQ4zzkDcWOQfFpA=; b=PFAhPQ1A4A36kXbTr8SXFEtAlH
 M6jAAGKXx2En+CbetOd5UQOgMqLPMlsyK9B76/z6pmp67eF9uTs+SXtCWA/8FLwV+ipMbOgquYjzJ
 03Obs2US46It8PNzzGt4qP8a7Jgz4iPkoaMBbHWm+1llouZ9J9HBJ5jfFod5fJlKrg/4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rejlF-0002IJ-1t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 22:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5465ACE062B;
 Mon, 26 Feb 2024 22:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C472C433C7;
 Mon, 26 Feb 2024 22:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708987656;
 bh=SIF6l2OHEXEE3BAbQV6qsonqNnLgzP8DvqtGYEaQfO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p00DO6ydaneDwhDZD87n2MMe5t7m6vJWietj9ki3VDSivg0mFNftdWa+kwiBfnfZY
 uUTWl2aw3awaqTWx6rU1iWJXAP0Urgz0r2xkvwbXAbfTPqcEHRDDjT4qpc5RrQt1O1
 pl7KzGBS0BGdDvNQcx7U961icohJeNW3AzOE0NbaUE63ZF/gM/eeulShaEZmPzVxcr
 8xd1UKweq57OMo57Sm4Vj6SDhXOMrtVUr2clqZgtK34L7cgZSWBn+yTfBG8EGO9Ku1
 fntyYzlhzyi1YIo9QPm1xGaSdV/tst2hNuclApwV4HFpjqKKXhcdMvgGeNN0xlfL9b
 WEoqzCPEXU0vw==
Date: Mon, 26 Feb 2024 14:47:34 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zd0VBo3ilwRq4BJy@google.com>
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-5-jaegeuk@kernel.org>
 <CACOAw_xdBY5Rg1J4jUTaH0UxVrdZ+CCVQj72q_cMxyCHuCTy_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xdBY5Rg1J4jUTaH0UxVrdZ+CCVQj72q_cMxyCHuCTy_Q@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 02/26, Daeho Jeong wrote: > On Fri, Feb 23, 2024 at 12:56 PM
    Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > Don't block mounting the
   partition, if cap is 100%. > > > > Signed-off-by: Jaegeuk Kim [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rejlF-0002IJ-1t
Subject: Re: [f2fs-dev] [PATCH 5/5] f2fs: allow to mount if cap is 100
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

T24gMDIvMjYsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIEZyaSwgRmViIDIzLCAyMDI0IGF0IDEy
OjU24oCvUE0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
RG9uJ3QgYmxvY2sgbW91bnRpbmcgdGhlIHBhcnRpdGlvbiwgaWYgY2FwIGlzIDEwMCUuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiA+IC0t
LQo+ID4gIGZzL2YyZnMvc2VnbWVudC5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMv
ZjJmcy9zZWdtZW50LmMKPiA+IGluZGV4IDZkNTg2YWU4YjU1Zi4uZjExMzYxMTUyZDJhIDEwMDY0
NAo+ID4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4gPiBAQCAtOTA0LDYgKzkwNCw5IEBAIGludCBmMmZzX2Rpc2FibGVfY3BfYWdhaW4oc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IHVudXNhYmxlKQo+ID4gIHsKPiA+ICAgICAgICAg
aW50IG92cF9ob2xlX3NlZ3MgPQo+ID4gICAgICAgICAgICAgICAgIChvdmVycHJvdmlzaW9uX3Nl
Z21lbnRzKHNiaSkgLSByZXNlcnZlZF9zZWdtZW50cyhzYmkpKTsKPiA+ICsKPiA+ICsgICAgICAg
aWYgKEYyRlNfT1BUSU9OKHNiaSkudW51c2FibGVfY2FwX3BlcmMgPT0gMTAwKQo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+IAo+IFdpdGggdGhpcywgZjJmcyB3aWxsIG5vdCBleGVjdXRl
IEdDLiBXaGF0IGlzIHRoaXMgMTAwCj4gdW51c2FibGVfY2FwX3BlcmMgdXNlZCBmb3I/CgpUaGVv
cml0aWNhbGx5LCBpdCB3b24ndCwgYnV0IEkgd2FzIGhpdHRpbmcgYSBHQyBsb29wLCBhbmQgSSBz
dXNwZWN0ZWQgYSB3cm9uZwpzZWN0aW9uL3NlZ21lbnQgbGF5b3V0LiBTbywgSSBwb3N0ZWQgdGhl
IGJlbG93LCBhbmQgZ3Vlc3Mgd2UgbmVlZCB0aGlzIHBhdGNoCmFzIHdvcmthcm91bmQuCgpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZjJmcy9wYXRjaC8yMDI0MDIyNDAxMTQx
MS4zODIwNzE5LTEtamFlZ2V1a0BrZXJuZWwub3JnLwoKPiAKPiA+ICAgICAgICAgaWYgKHVudXNh
YmxlID4gRjJGU19PUFRJT04oc2JpKS51bnVzYWJsZV9jYXApCj4gPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FQUdBSU47Cj4gPiAgICAgICAgIGlmIChpc19zYmlfZmxhZ19zZXQoc2JpLCBTQklf
Q1BfRElTQUJMRURfUVVJQ0spICYmCj4gPiAtLQo+ID4gMi40NC4wLnJjMC4yNTguZzczMjBlOTU4
ODYtZ29vZwo+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
