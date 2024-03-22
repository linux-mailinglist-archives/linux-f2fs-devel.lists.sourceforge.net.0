Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4064886457
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 01:29:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnSmh-0005Rx-Sq;
	Fri, 22 Mar 2024 00:29:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rnSmd-0005Ro-6R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 00:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GNpgnbDpAl6kROWcdsCXLTVHsC9Z2LVhO4npbzyecIc=; b=HiyQjsHvHbMpaaZZToOqZo/hM0
 U+GMYCC+P+PJAGfbqNwTN8QXrsQ6ZpykVkk03Jq6vDOKsbJBnZJF923nrgL6cF2fFwa9Jggu8hx2E
 BCCDqJ7aZjcquNJwd0PKOVEIhOPGCEZ9LQAYcD2h8cUg3DaMj4i/P3kSf9ryEqA4esd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GNpgnbDpAl6kROWcdsCXLTVHsC9Z2LVhO4npbzyecIc=; b=X1Yp/QPTDjAaT1uNTM+/33yJt+
 tLPg+qiHIBs6APIAA0Vb7tPyCJiLihyC8Nz3pNoUukXpQAg9TzspbhIgBJzgB7LrnzQuZ+VN0JyzS
 LRTXSiBjnDxDUNu2dn8mGXCvLabcIKBuqP+N2xpDXq8abEvYbaEdTZI+7Poey6914Zp4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnSmZ-00048d-QW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 00:29:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A1BC61326;
 Fri, 22 Mar 2024 00:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE22C433C7;
 Fri, 22 Mar 2024 00:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711067345;
 bh=8QFd8esOMW5rZVdTF+FCShS/VOhr21smwFjuIbVf8dE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g7V8xRvVsvOYIV9nsn7wk/8oQODqnW3bKT4vXuj7EeiHsZ+kj++MuCorDx48ieYUf
 G7Y1xnz/pzb4pKo+fR0BafpSxjbyaaLlyNdci9vjsKIk14BFYR/PubUXqJb7615yJR
 47rSc0li+j1pqD456aVwZl7cgQ7RRUetTkqwJXB2b2zOYEr2jC1oEumP71BempwFMr
 OVeeSHUxL5ABaKsD96mJWYbgfrY5q62x6ib3cK7AE+1MPV0gLb0g603UGhincMPicS
 0Co3OaYkLDzXL/L138KGDrDKACJhYrZrVdHegpwZTneqPJ3pvPn545jjEG9hYN4pU8
 jhCzcgD50JxYQ==
Date: Thu, 21 Mar 2024 17:29:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Hillf Danton <hdanton@sina.com>
Message-ID: <ZfzQz5hwECOEGYVL@google.com>
References: <20240320001442.497813-1-jaegeuk@kernel.org>
 <20240321224233.2541-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240321224233.2541-1-hdanton@sina.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/22, Hillf Danton wrote: > On Tue, 19 Mar 2024 17:14:42
 -0700 Jaegeuk Kim <jaegeuk@kernel.org> > >
 f2fs_ioc_shutdown(F2FS_GOING_DOWN_NOSYNC)
 issue_discard_thread > > - mnt_want_write_file() > > - [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rnSmZ-00048d-QW
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid the deadlock case when stopping
 discard thread
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
Cc: linux-kernel@vger.kernel.org,
 Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDMvMjIsIEhpbGxmIERhbnRvbiB3cm90ZToKPiBPbiBUdWUsIDE5IE1hciAyMDI0IDE3OjE0
OjQyIC0wNzAwIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4gPiBmMmZzX2lvY19z
aHV0ZG93bihGMkZTX0dPSU5HX0RPV05fTk9TWU5DKSAgaXNzdWVfZGlzY2FyZF90aHJlYWQKPiA+
ICAtIG1udF93YW50X3dyaXRlX2ZpbGUoKQo+ID4gICAgLSBzYl9zdGFydF93cml0ZShTQl9GUkVF
WkVfV1JJVEUpCj4gCSBfX3NiX3N0YXJ0X3dyaXRlKCkKPiAJICAgcGVyY3B1X2Rvd25fcmVhZCgp
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIHNiX3N0
YXJ0X2ludHdyaXRlKFNCX0ZSRUVaRV9GUyk7Cj4gCQkJCQkJICAgX19zYl9zdGFydF93cml0ZSgp
Cj4gCQkJCQkJICAgICBwZXJjcHVfZG93bl9yZWFkKCkKPiAKPiBHaXZlbiBsb2NrIGFjcXVpcmVy
cyBmb3IgcmVhZCBvbiBib3RoIHNpZGVzLCB3dGYgZGVhZGxvY2sgYXJlIHlvdSBmaXhpbmc/CgpE
YW1uLiBJIGNvdWxkbid0IHRoaW5rIF93cml0ZSB1c2VzIF9yZWFkIHNlbS4KCj4gCj4gPiAgLSBm
MmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLCAgICAgICAgICAgIDogd2FpdGluZwo+ID4g
ICAgIFNUT1BfQ1BfUkVBU09OX1NIVVRET1dOKTsKPiA+ICAtIGYyZnNfc3RvcF9kaXNjYXJkX3Ro
cmVhZChzYmkpOwo+ID4gICAgLSBrdGhyZWFkX3N0b3AoKQo+ID4gICAgICA6IHdhaXRpbmcKPiA+
IAo+ID4gIC0gbW50X2Ryb3Bfd3JpdGVfZmlsZShmaWxwKTsKPiAKPiBNb3JlIGltcG9ydGFudCwg
ZmVlbCBmcmVlIHRvIGFkZCBpbiBzcGluLgoKSSBwb3N0ZWQgdGhpcyBwYXRjaCBiZWZvcmUgTGln
aHQgcmVwb3J0ZWQuCgpBbmQsIGluIHRoZSByZXBvcnQsIEkgZGlkbid0IGdldCB0aGlzOgoKZjJm
c19pb2Nfc2h1dGRvd24oKSAtLT4gZnJlZXplX2JkZXYoKSAtLT4gZnJlZXplX3N1cGVyKCkgLS0+
IHNiX3dhaXRfd3JpdGUoc2IsIFNCX0ZSRUVaRV9GUykgLS0+IC4uLiAtPnBlcmNwdV9kb3duX3dy
aXRlKCkuCgpiZWNhdXNlIGYyZnNfaW9jX3NodXRkb3duKCkgY2FsbHMgZjJmc19zdG9wX2Rpc2Nh
cmRfdGhyZWFkKCkgYWZ0ZXIgdGhhd19iZGV2KCkKbGlrZSB0aGlzIG9yZGVyLgoKIC0+IGZyZWV6
ZV9iZGV2KCkKIC0+IHRoYXdfYmRldigpCiAtPiBmMmZzX3N0b3BfZGlzY2FyZF90aHJlYWQoKQoK
QW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCj4gCj4gCVJlcG9ydGVkLWJ5OiAiTGlnaHQgSHNpZWgg
KOisneaYjueHiCkiIDxMaWdodC5Ic2llaEBtZWRpYXRlay5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
