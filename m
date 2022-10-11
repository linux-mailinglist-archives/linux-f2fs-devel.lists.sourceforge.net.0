Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3875FBE28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Oct 2022 01:02:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oiOGr-0007zf-O4;
	Tue, 11 Oct 2022 23:02:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oiOGq-0007zZ-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Oct 2022 23:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cU8PJZUIq+w6p4VgAdDvTi1kXmxx/MCxtzkrO/AOEag=; b=EHm7ZcVcKIxqGESVxv+20LxFiu
 pphoZP+/gZ0tzS3hdUk9XFnBjbhEe35C7cWqkozrg84DFIcr9odnhrTe79pZSm9ZQaW5SHHDxBPL2
 98KkXRIRMfEBvTKxztry8A0A7am2xT3hMIfLt0cJ0c+728liygyAOvcyUHsCMn4kOw/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cU8PJZUIq+w6p4VgAdDvTi1kXmxx/MCxtzkrO/AOEag=; b=Y9mfAkAo3H8gYJhXoqEqkA+c/+
 wU+6tGYfe4EudDsVX5X1+pelpeM2JqLFgHI0HZwaOTLbKuGkgY6VIdFrqJttR79onpfsUnd9KJhmh
 tA5ZoyHnvZCmqYZWAoTS5+RSoFLf+G+IZmVCXb3fTGpAafy6CV5ckYiFjUOZmptl0p3E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oiOGp-000Kgs-CD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Oct 2022 23:02:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FBC0B811BD;
 Tue, 11 Oct 2022 23:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8717FC433D6;
 Tue, 11 Oct 2022 23:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665529355;
 bh=y4Ano1StaiQUYrKYxW/krjKkHKYUUCVRriaLSIOEAic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZIFsAjLpJlnbBWUJKuBh0F5S/GKgabGfqQTZt8SwwkP/J7rmJxFBmdvyxWpJY1Y9
 3QW5uMvFKuAe9HRFYlHKD4pi0/xv9MO0iWOnIf2AaqjytVfWJr8aVejJeLExJ/5KZ3
 FrlFesvrqUYR/3JbrOA9OamXCfJjwQ/ne2rrxCnn7+JkgnaUtxq8jzzju5lNX9VZMj
 OGx/bWnGyw+FFs/AoVq28SHVdUyPbpIo9h4hq6hcEOD4KPNhe0MRYfhZxFJTCExz4F
 W36vvHtVIwfEG0+ZL+Eohic99c9jg9AxKCclN8amYinpbZSG2RDhRYsGaXHRgXP5kM
 kAk+ZlelP4YYA==
Date: Tue, 11 Oct 2022 16:02:33 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alejandro Colomar <alx.manpages@gmail.com>
Message-ID: <Y0X2CbXstn8qojPF@sol.localdomain>
References: <20221004174307.6022-1-ebiggers@kernel.org>
 <26cafc28-e63a-6f13-df70-8ccec85a4ef0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26cafc28-e63a-6f13-df70-8ccec85a4ef0@gmail.com>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Alejandro, On Sat, Oct 08, 2022 at 03:56:22AM +0200,
 Alejandro
 Colomar wrote: > > +If none of the above is available, then direct I/O support
 and alignment > > Please use semantic newlines. > > See man-pages(7): [...]
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oiOGp-000Kgs-CD
Subject: Re: [f2fs-dev] [man-pages PATCH v3] statx.2,
 open.2: document STATX_DIOALIGN
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
Cc: linux-man@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQWxlamFuZHJvLAoKT24gU2F0LCBPY3QgMDgsIDIwMjIgYXQgMDM6NTY6MjJBTSArMDIwMCwg
QWxlamFuZHJvIENvbG9tYXIgd3JvdGU6Cj4gPiArSWYgbm9uZSBvZiB0aGUgYWJvdmUgaXMgYXZh
aWxhYmxlLCB0aGVuIGRpcmVjdCBJL08gc3VwcG9ydCBhbmQgYWxpZ25tZW50Cj4gCj4gUGxlYXNl
IHVzZSBzZW1hbnRpYyBuZXdsaW5lcy4KPiAKPiBTZWUgbWFuLXBhZ2VzKDcpOgo+ICAgIFVzZSBz
ZW1hbnRpYyBuZXdsaW5lcwo+ICAgICAgICBJbiB0aGUgc291cmNlIG9mIGEgbWFudWFsIHBhZ2Us
IG5ldyBzZW50ZW5jZXMgIHNob3VsZCAgYmUKPiAgICAgICAgc3RhcnRlZCBvbiBuZXcgbGluZXMs
IGxvbmcgc2VudGVuY2VzIHNob3VsZCBiZSBzcGxpdCBpbnRvCj4gICAgICAgIGxpbmVzICBhdCAg
Y2xhdXNlIGJyZWFrcyAoY29tbWFzLCBzZW1pY29sb25zLCBjb2xvbnMsIGFuZAo+ICAgICAgICBz
byBvbiksIGFuZCBsb25nIGNsYXVzZXMgc2hvdWxkIGJlIHNwbGl0IGF0IHBocmFzZSBib3VuZOKA
kAo+ICAgICAgICBhcmllcy4gIFRoaXMgY29udmVudGlvbiwgIHNvbWV0aW1lcyAga25vd24gIGFz
ICAic2VtYW50aWMKPiAgICAgICAgbmV3bGluZXMiLCAgbWFrZXMgaXQgZWFzaWVyIHRvIHNlZSB0
aGUgZWZmZWN0IG9mIHBhdGNoZXMsCj4gICAgICAgIHdoaWNoIG9mdGVuIG9wZXJhdGUgYXQgdGhl
IGxldmVsIG9mIGluZGl2aWR1YWwgc2VudGVuY2VzLAo+ICAgICAgICBjbGF1c2VzLCBvciBwaHJh
c2VzLgoKSSB0cmllZCB0byBkbyB0aGlzIGluIHY0LiAgSXQgc2VlbXMgdmVyeSBhcmJpdHJhcnks
IHRob3VnaCwgc28gaWYgeW91IHdhbnQKZnVydGhlciBjaGFuZ2VzIHRvIHRoZSBuZXdsaW5lcyBJ
IHJlY29tbWVuZCBqdXN0IG1ha2luZyB0aGVtIHdoZW4gY29tbWl0dGluZyB0aGUKcGF0Y2guCgpO
b3RlIHRoYXQgYSBiZXR0ZXIgd2F5IHRvIHJldmlldyBjaGFuZ2VzIHRvIHRleHQgaXMgdG8gZG8g
YSB3b3JkIGRpZmYgaW5zdGVhZCBvZgphIGxpbmUgZGlmZi4KCi0gRXJpYwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
