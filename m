Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B48043D7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Dec 2023 02:16:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAK39-0003Ix-4F;
	Tue, 05 Dec 2023 01:16:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rAK31-0003Iq-4w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 01:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aGVzx7FQeC+1KSLlkAkUMMGowUPXOEE15DYhdZgi98k=; b=Smi+KIgPgHrnz1MQbBEgI8qd5e
 QXinPparpIZvrIfZsbAAkgauHgA34bItkSxrjjxI9TNspGtGiYcGLDxrdVU8VcWWvkb1NRJZxoPi1
 sl8r8pDuY7z3A890MDoMx/+XybiU97Ef43hW98rK3FnqXDpSljXtJVA16pvFyZBWW49M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aGVzx7FQeC+1KSLlkAkUMMGowUPXOEE15DYhdZgi98k=; b=GT/wG4mudiYV9/kELReOaWYMzp
 widpCskA+ehTXAsVcPk9hd3/Q5WlgO0Bcnh83a2pggARZbgU510KBYF/x8/p2SCkLAtUwNjE5Xfw5
 v9rRDwuVUUI96emVgIolBxkdrcnt/piJXHBB9NtHz6TI0JGWafEYpLC2RY2kBfwsnYHk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rAK2z-0007dq-AM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Dec 2023 01:16:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1D99ACE069D;
 Tue,  5 Dec 2023 01:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C345C433C7;
 Tue,  5 Dec 2023 01:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701738968;
 bh=PbxIc7G8brLLvlnNz5g5QO7nT7rXf2EgJUvgPLPt0+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YlkupZ7zjF6CjHvGvUSmil2kuX81FNp6Sxx7qOz7TlU30sHic3G7j2ZUUt9SZqd8D
 uw8ynekTSjYzKVb0ONlHGZLTowY1XVWXsjQGxN11OX8QVHufPe61RgFYnJ2QceGXOQ
 T4rWV8YpqL9KnIbdrVV4u1KENcQxRcZgOXP2hBTWxjuC5R+fTMqixT7nPavQKioYuG
 HNnxJo4JWM48huNbgxt+pWJmR960bNnKze61pWCCNilUgORGvVRcakPCSM6t7CnKUg
 z895BVQyAHzOzwT4R9QrLm58J85ok0MBkWBJaLP/RXKnuhcq1cA7yDy78EFpVC6eM8
 rlhNz1n6tqbDg==
Date: Mon, 4 Dec 2023 17:16:06 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <ZW551kua2GX0GcIY@google.com>
References: <20231204180551.927014-1-jaegeuk@kernel.org>
 <CACOAw_zQ8X=HWbX+oiQUeQ0dM7zYJgwTfqWJ6rMBa8rykctJaw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zQ8X=HWbX+oiQUeQ0dM7zYJgwTfqWJ6rMBa8rykctJaw@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Thanks. Let me add reviewed-by. :) On 12/04, Daeho Jeong wrote:
    > LGTM > > On Mon, Dec 4, 2023 at 10:07 AM Jaegeuk Kim <jaegeuk@kernel.org>
    wrote: > > > > Let's fix any inconsistency until checkpint being enabled
   back. > > > > Signed [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rAK2z-0007dq-AM
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: run full scan if checkpoint is
 disabled
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

VGhhbmtzLiBMZXQgbWUgYWRkIHJldmlld2VkLWJ5LiA6KQoKT24gMTIvMDQsIERhZWhvIEplb25n
IHdyb3RlOgo+IExHVE0KPiAKPiBPbiBNb24sIERlYyA0LCAyMDIzIGF0IDEwOjA34oCvQU0gSmFl
Z2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gTGV0J3MgZml4IGFu
eSBpbmNvbnNpc3RlbmN5IHVudGlsIGNoZWNrcGludCBiZWluZyBlbmFibGVkIGJhY2suCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiA+IC0t
LQo+ID4gIGZzY2svbW91bnQuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mc2NrL21vdW50LmMgYi9mc2NrL21vdW50LmMKPiA+
IGluZGV4IGU5NTc5MDQ0OTRlZi4uMzBjNjIyODBiMjgxIDEwMDY0NAo+ID4gLS0tIGEvZnNjay9t
b3VudC5jCj4gPiArKysgYi9mc2NrL21vdW50LmMKPiA+IEBAIC0xNDM1LDYgKzE0MzUsNyBAQCBz
dGF0aWMgaW50IGYyZnNfc2hvdWxkX3Byb2NlZWQoc3RydWN0IGYyZnNfc3VwZXJfYmxvY2sgKnNi
LCB1MzIgZmxhZykKPiA+ICB7Cj4gPiAgICAgICAgIGlmICghYy5maXhfb24gJiYgKGMuYXV0b19m
aXggfHwgYy5wcmVlbl9tb2RlKSkgewo+ID4gICAgICAgICAgICAgICAgIGlmIChmbGFnICYgQ1Bf
RlNDS19GTEFHIHx8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBmbGFnICYgQ1BfRElTQUJM
RURfRkxBRyB8fAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZmxhZyAmIENQX1FVT1RBX05F
RURfRlNDS19GTEFHIHx8Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjLmFibm9ybWFsX3N0
b3AgfHwgYy5mc19lcnJvcnMgfHwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIChleGlzdF9x
Zl9pbm8oc2IpICYmIChmbGFnICYgQ1BfRVJST1JfRkxBRykpKSB7Cj4gPiAtLQo+ID4gMi40My4w
LnJjMi40NTEuZzg2MzFiYzc0NzItZ29vZwo+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4g
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
