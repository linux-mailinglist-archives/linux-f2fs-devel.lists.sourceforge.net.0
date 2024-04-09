Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08289D0FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 05:24:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ru25V-0006Bd-Gm;
	Tue, 09 Apr 2024 03:23:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ru25T-0006BU-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 03:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aD1MuER9F71EqOBmJ/WwNg1rZyA50vKGzwHVFMxQTjM=; b=XH8Nq2oVLloQoo96UeMUeqyIwp
 IAnlxa4dpNrxORUEk8m7u9K050bZzzvAV+VA1rAD8Yh2nVJ+GuCohf+GN6ugcAo3SbNGOCs9s1+1y
 4M3lwWeSOOV0o/5cFPI5f1ab+rlR+qr8Cn+fEXYnaxDG6h5XYRSzhGhwnHPaHTxfQZBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aD1MuER9F71EqOBmJ/WwNg1rZyA50vKGzwHVFMxQTjM=; b=JE30Lv5AX6k0G2COOxps6GgOQV
 kfTnnOGXuyLTyWwNnF3m0O3Y/DCbnBZKoEaosWz8tVE7nYejHo9PfX45fpsljsp2bj6N9v4GE+t3W
 IlKW2kyLy24e8FIdutAHDRjvjecZGmqYFVhTHSMtr5yXtVDTnDgD5RDjvEsajEhzCsOM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ru25T-0007iY-5N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 03:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66874CE1B9C;
 Tue,  9 Apr 2024 03:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F30C433C7;
 Tue,  9 Apr 2024 03:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712633021;
 bh=heUw+z02lSXePDybJSxjPXBkHjsdfr4yAQ0XueZUSJk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uYICjupj82TBb6nIGAbyn88j7LHfRu7Wk7jQeWX6ZT9X+LEDbRpziV5Kd8hSQ5WaW
 mL+yaggUIwPAXoDRbs+XteqO1J0Wbcc64kButb8DlqCcbesM2OWoSlAsrZ3h64iyao
 Uo/MKW6lLKM2WkuhB1E2L0M7cD9Q+cksn/WjEpdThtnggokrcw4mfsTkfkNQVCKKZx
 zMkG10+3k4EvfwOJ52LKpO+u4TL6cRhCa2EZKhxGnvXXQac6WNwXGZE8TA65jXYg8U
 UKIiJ4aDcoISjq+D3sxk9rqgHTVjjZkfjJPNOodkZk2kofNe8riTyPE8je2bS+lQbj
 2eC4AI+hMXNwA==
Message-ID: <2c195fee-c71c-4e44-b24f-9880b3c1b6c4@kernel.org>
Date: Tue, 9 Apr 2024 11:23:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240404195254.556896-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240404195254.556896-1-jaegeuk@kernel.org>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/5 3:52,
 Jaegeuk Kim wrote: > Shutdown does not check
 the error of thaw_super due to readonly, which > causes a deadlock like below.
 > > f2fs_ioc_shutdown(F2FS_GOING_DOWN_FULLSYNC) issue_disc [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ru25T-0007iY-5N
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set RO when shutting down f2fs
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
Cc: =?UTF-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC80LzUgMzo1MiwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gU2h1dGRvd24gZG9lcyBub3Qg
Y2hlY2sgdGhlIGVycm9yIG9mIHRoYXdfc3VwZXIgZHVlIHRvIHJlYWRvbmx5LCB3aGljaAo+IGNh
dXNlcyBhIGRlYWRsb2NrIGxpa2UgYmVsb3cuCj4gCj4gZjJmc19pb2Nfc2h1dGRvd24oRjJGU19H
T0lOR19ET1dOX0ZVTExTWU5DKSAgICAgICAgaXNzdWVfZGlzY2FyZF90aHJlYWQKPiAgIC0gYmRl
dl9mcmVlemUKPiAgICAtIGZyZWV6ZV9zdXBlcgo+ICAgLSBmMmZzX3N0b3BfY2hlY2twb2ludCgp
Cj4gICAgLSBmMmZzX2hhbmRsZV9jcml0aWNhbF9lcnJvciAgICAgICAgICAgICAgICAgICAgIC0g
c2Jfc3RhcnRfd3JpdGUKPiAgICAgIC0gc2V0IFJPICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtIHdhaXRpbmcKPiAgIC0gYmRldl90aGF3Cj4gICAgLSB0aGF3X3N1cGVy
X2xvY2tlZAo+ICAgICAgLSByZXR1cm4gLUVJTlZBTCwgaWYgc2JfcmRvbmx5KCkKPiAgIC0gZjJm
c19zdG9wX2Rpc2NhcmRfdGhyZWFkCj4gICAgLT4gd2FpdCBmb3Iga3RocmVhZF9zdG9wKGRpc2Nh
cmRfdGhyZWFkKTsKPiAKPiBSZXBvcnRlZC1ieTogIkxpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIiA8
TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxq
YWVnZXVrQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBmcy9mMmZzL3N1cGVyLmMgfCAxMSArKysrKysr
KystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gaW5k
ZXggZGY5NzY1YjQxZGFjLi5iYTYyODhlODcwYzUgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zdXBl
ci5jCj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTQxMzUsOSArNDEzNSwxNiBAQCB2b2lk
IGYyZnNfaGFuZGxlX2NyaXRpY2FsX2Vycm9yKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5z
aWduZWQgY2hhciByZWFzb24sCj4gICAJaWYgKHNodXRkb3duKQo+ICAgCQlzZXRfc2JpX2ZsYWco
c2JpLCBTQklfSVNfU0hVVERPV04pOwo+ICAgCj4gLQkvKiBjb250aW51ZSBmaWxlc3lzdGVtIG9w
ZXJhdG9ycyBpZiBlcnJvcnM9Y29udGludWUgKi8KPiAtCWlmIChjb250aW51ZV9mcyB8fCBmMmZz
X3JlYWRvbmx5KHNiKSkKPiArCS8qCj4gKwkgKiBDb250aW51ZSBmaWxlc3lzdGVtIG9wZXJhdG9y
cyBpZiBlcnJvcnM9Y29udGludWUuIFNob3VsZCBub3Qgc2V0Cj4gKwkgKiBSTyBieSBzaHV0ZG93
biwgc2luY2UgUk8gYnlwYXNzZXMgdGhhd19zdXBlciB3aGljaCBjYW4gaGFuZyB0aGUKPiArCSAq
IHN5c3RlbS4KPiArCSAqLwo+ICsJaWYgKGNvbnRpbnVlX2ZzIHx8IGYyZnNfcmVhZG9ubHkoc2Ip
IHx8Cj4gKwkJCQlyZWFzb24gPT0gU1RPUF9DUF9SRUFTT05fU0hVVERPV04pIHsKPiArCQlmMmZz
X3dhcm4oc2JpLCAiU3RvcHBlZCBmaWxlc3lzdGVtIGR1ZSB0byByZWFkb246ICVkIiwgcmVhc29u
KTsKPiAgIAkJcmV0dXJuOwoKRG8gd2UgbmVlZCB0byBzZXQgUk8gYWZ0ZXIgYmRldl90aGF3KCkg
aW4gZjJmc19kb19zaHV0ZG93bigpPwoKVGhhbmtzLAoKPiArCX0KPiAgIAo+ICAgCWYyZnNfd2Fy
bihzYmksICJSZW1vdW50aW5nIGZpbGVzeXN0ZW0gcmVhZC1vbmx5Iik7Cj4gICAJLyoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
