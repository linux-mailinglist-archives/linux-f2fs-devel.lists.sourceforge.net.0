Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487878161C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Aug 2023 02:35:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qX9wF-0004bA-68;
	Sat, 19 Aug 2023 00:35:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qX9wD-0004b4-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 00:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJLpL43e9nBneNhL7eyV5za8CRq5W5WEAEqh9f0y184=; b=DQl4me4XdI3veA4B5X1DE/qyis
 nEUrRelRdAhsQOhyinBe4EJQsA6BHS6APojN7FG8RoIbf3KSanZkCuJLklDI+8FeQJ/0MkqNxSfgN
 3m6K9Gcypzek0l7Vh7FPhmuzm1k173FtvWG0zCb4sTAmkJ0pDYbrCy5GcwEMMst5s8V8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NJLpL43e9nBneNhL7eyV5za8CRq5W5WEAEqh9f0y184=; b=QF8eIl/JiqW27ExbgbVi676M6z
 VRSzsWYMMKy46wFBs0jzNHCB7lfHc85nwCENZsAohW2uPXvtpJbp8U7EXX4Lzc2shW5FDsXoyk2ct
 ZQDG0H/kbdeOi2o4d4n2PK8R/CaeRsUr+2AybNIwUi05qd7zPTY/fFFB+0nRsG2vtNN4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qX9wD-0001g4-7u for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 19 Aug 2023 00:35:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A232E60FBE;
 Sat, 19 Aug 2023 00:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19F3C433C8;
 Sat, 19 Aug 2023 00:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692405327;
 bh=wciWpuowIhLN9HIjqncTt6wVumkam4XiTnXTQoiGgng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R4ec7exd5Ov3t4yF/btQPtTN55y7LgyQqm2H1OLVCroW4qHmDuQvqluZApKi9tqSJ
 PLfmWwvAPF7m7Ri99u11dBi0FavrmIWGNL2pttAY69V+ktzNmBzblCaSqmFeEkKGG6
 AHEWMSBGmKS/UVzwt3w7QwfL84bvSdM3gCK97WN2MeFPopWufWFSb3x2b4nLlK5jVz
 tV1CAOuFcp/i/SNyMSiCQSCqh+CogOZXd6cROXJMg89xiZI6rAG3xUCv0M8CfkTpHm
 BPoC6uHBoVK4l5iOUd40sZN0r5Wb63AL2DURP2EfXrccNEUN3lI7wLNey/bL6TjIgn
 BWlvxXInGaqVw==
Date: Fri, 18 Aug 2023 17:35:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk.kim@gmail.com>
Message-ID: <ZOAOTcUAskB+F5ez@google.com>
References: <ae78956b-0c55-4980-8ec4-5cccf7e69c16@roeck-us.net>
 <CAOtxgyeE+PLWVCTMHbr6OgwXY5MB1vPmauY2wcvEZdW8OhM-YQ@mail.gmail.com>
 <93fee6c4-fb2b-49eb-ab54-e77603289f6a@roeck-us.net>
 <CAOtxgychpamcvMDtOcX=ZGsL8WPfYfLAjCRg-YAnEHYDBva+7g@mail.gmail.com>
 <63722b9f-b510-50a7-8839-6ada783d2164@kernel.org>
 <20230817155319.GA1483@sol.localdomain>
 <700c2e58-d2fe-47c6-85a8-aa7f7b1613cf@roeck-us.net>
 <CAOtxgyedoExF5yfJO6BkU6fYjJMpfJBDuEuG_2rjyT7o9qcX4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOtxgyedoExF5yfJO6BkU6fYjJMpfJBDuEuG_2rjyT7o9qcX4Q@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  May I know if this works? https://lore.kernel.org/linux-f2fs-devel/20230819003012.3473675-1-jaegeuk@kernel.org/T/#u
    On 08/18, Jaegeuk Kim wrote: > Chao, > > Do you have some bandwidth to address
    this? Otherwise, I'll do some. > > Thanks, > > On Fri, Aug 18, 2023 at 6:15 AM
    Guenter Roeck <linux@roeck-us.net> wrote [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qX9wD-0001g4-7u
Subject: Re: [f2fs-dev] circular locking dependency warning in f2fs
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
Cc: Eric Biggers <ebiggers@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TWF5IEkga25vdyBpZiB0aGlzIHdvcmtzPwoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
ZjJmcy1kZXZlbC8yMDIzMDgxOTAwMzAxMi4zNDczNjc1LTEtamFlZ2V1a0BrZXJuZWwub3JnL1Qv
I3UKCk9uIDA4LzE4LCBKYWVnZXVrIEtpbSB3cm90ZToKPiBDaGFvLAo+IAo+IERvIHlvdSBoYXZl
IHNvbWUgYmFuZHdpZHRoIHRvIGFkZHJlc3MgdGhpcz8gT3RoZXJ3aXNlLCBJJ2xsIGRvIHNvbWUu
Cj4gCj4gVGhhbmtzLAo+IAo+IE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDY6MTXigK9BTSBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgQXVn
IDE3LCAyMDIzIGF0IDA4OjUzOjE5QU0gLTA3MDAsIEVyaWMgQmlnZ2VycyB3cm90ZToKPiA+ID4g
T24gVGh1LCBBdWcgMTcsIDIwMjMgYXQgMTA6MjY6MTJQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbG9jayhuZXdfaW5vZGUjMi0+aV9zZW0pCj4gPiA+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2soZGlyLT5pX3hh
dHRyX3NlbSkKPiA+ID4gPiA+ID4gPiBsb2NrKG5ld19pbm9kZSMxLT5pX3NlbSkKPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IFRoaXMgbG9va3MgZmluZSB0byBtZS4KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBCYXNlZCBvbiB5b3VyIGZlZWRiYWNrLCBhbSBJIGNvcnJl
Y3QgYXNzdW1pbmcgdGhhdCB5b3UgZG9uJ3QgcGxhbgo+ID4gPiA+ID4gPiB0byBmaXggdGhpcyA/
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSdtIHF1aXRlIG9wZW4gdG8gc29tZXRoaW5nIHRoYXQgSSBt
YXkgbWlzcy4gQ2hhbywgd2hhdCBkbyB5b3UgdGhpbms/Cj4gPiA+ID4KPiA+ID4gPiBKYWVnZXVr
LCBJIGFncmVlIHdpdGggeW91LCBpdCBsb29rcyBsaWtlIGEgZmFsc2UgYWxhcm0uCj4gPiA+ID4K
PiA+ID4KPiA+ID4gRmFsc2UgcG9zaXRpdmUgbG9ja2RlcCByZXBvcnRzIHN0aWxsIG5lZWQgdG8g
YmUgZWxpbWluYXRlZCwgZm9yIGV4YW1wbGUgYnkKPiA+ID4gZml4aW5nIHRoZSBsb2NrZGVwIGFu
bm90YXRpb25zLiAgT3RoZXJ3aXNlIGl0J3MgaW1wb3NzaWJsZSB0byBkaXN0aW5ndWlzaCB0aGVt
Cj4gPiA+IGZyb20gdHJ1ZSBwb3NpdGl2ZXMuCj4gPiA+Cj4gPgo+ID4gRXhhY3RseSwgYW5kIHRo
YXQgaXMgd2h5IEkgZG9uJ3QgdGVzdCBmZWF0dXJlcyB3aXRoIGtub3duIGxvY2tkZXAgYW5ub3Rh
dGlvbgo+ID4gaXNzdWVzLiBJJ2xsIGRyb3AgZjJmcyBmcm9tIG15IGxpc3Qgb2YgZmVhdHVyZXMg
dG8gdGVzdCBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gPgo+ID4gR3VlbnRlcgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
