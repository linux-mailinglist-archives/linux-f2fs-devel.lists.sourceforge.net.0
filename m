Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKzeJrcTR2oYTAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 03:43:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C0B6FDC42
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 03:43:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=h7xJSMOC;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="Z/OYfVxF";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=HuH5TWmy;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="dJtuR/82";
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wjxjh8FCTlJyg1HpxFybD1x/0jMWI/ZD8yO3TPStMGE=; b=h7xJSMOCo0SkUJp0/bVyRF1GOI
	AZna6Aonws5ffN91DCEzkNPDu41E8F4XCTzQbnhjRKDCH+oxtv8ePZejWuYCO1l/GP3kYXkbpNw5e
	eC7jKVHBRuaKQvJxJIybyNOGNduFLNq1dLKa6awnhBA7E2x0Tk8KCl35UrRaRIHVQFAE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfSvu-00048L-HF;
	Fri, 03 Jul 2026 01:43:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wfSvt-00048F-Kz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 01:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AX4qRITMVBxo2syOiuIn5nihRYToP/HhChwFyF/gFaQ=; b=Z/OYfVxFRHSGvA6NMgWFcr/Uqr
 0AIy425rWSRJdZsb8+/mu24L+//BhB16nhpxGk/yxg81pYXHFG4HTUCjPKIUiaVQuwnY2afsTvw/0
 +AH6JLAFPOMACBm+z6Z2KVyjqwJXL8ras+Adxh+doGYiYGTTjSUbSeiyC7eLkmAa+OsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AX4qRITMVBxo2syOiuIn5nihRYToP/HhChwFyF/gFaQ=; b=HuH5TWmymXEmeoTGtu2YP9b9Zw
 hd+hC7i6LWEbLKinMaDv3VD/5WRszeVS1raioIqJHHamhrlfZi8VaVs66ze2ebjrcUKiLsvFu8ZxP
 uz8g6xjSCrUCflTT87fuNKc2/pG+BbtjkXlqBpL9CoeJdKm8hfKya97KQ2mrdGm0gdDs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfSvq-00088v-3s for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 01:43:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 31877417C3;
 Fri,  3 Jul 2026 01:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EFEF41F00A3A;
 Fri,  3 Jul 2026 01:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783042976;
 bh=AX4qRITMVBxo2syOiuIn5nihRYToP/HhChwFyF/gFaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=dJtuR/82aT9h1ImO0a7pYJQJ+soh57RpaSsmH5o5j8IK42iv/kQcFlPB7G3vFH4zD
 1cI/SGmmNm3EEL6hcAAYkT4Cd9gRd1KbwZAx1RrmLI0EXdSf/I7vlhkKUPloFFQFee
 mo7Sy4AoM5ffBWElmdGzSCFl7tzmoFL2T8PkfPcgWfWsmksc77beqcX/v8FPel49/a
 WL/a6F6omLU837kQyj/YQ2Bnb8p5c5Jge2S29NN/YRr4I65yaPrg3fle9EEwK5trBb
 rNXtXGBsg5Zx8ICE/FevfeOhXvdgaCFoi43mChEiMQwqoq9IOuC8mhW4d404Wyok50
 oL2V6nXFK4a4g==
Date: Thu, 2 Jul 2026 18:42:55 -0700
To: Joanne Koong <joannelkoong@gmail.com>
Message-ID: <20260703014255.GR9392@frogsfrogsfrogs>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
 <20260702165841.GM9392@frogsfrogsfrogs>
 <CAJnrk1YW0gKRVvHRC+WeKoV2vrquzaC6UkipZkQ34Z0RAQDjtg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJnrk1YW0gKRVvHRC+WeKoV2vrquzaC6UkipZkQ34Z0RAQDjtg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 02, 2026 at 05:17:02PM -0700, Joanne Koong wrote:
 > On Thu, Jul 2, 2026 at 9:58 AM Darrick J. Wong <djwong@kernel.org> wrote:
 > > > > > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wfSvq-00088v-3s
Subject: Re: [f2fs-dev] [PATCH v2 17/18] iomap: pass iomap_next_fn directly
 instead of struct iomap_ops
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, hch@lst.de, hsiangkao@linux.alibaba.com,
 Gao Xiang <xiang@kernel.org>,
 "open list:EXT2 FILE SYSTEM" <linux-ext4@vger.kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 "open list:FUSE FILESYSTEM \[CORE\]" <fuse-devel@lists.linux.dev>,
 brauner@kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:NTFS3 FILESYSTEM" <ntfs3@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, "open list:GFS2 FILE SYSTEM" <gfs2@lists.linux.dev>,
 "open list:FILESYSTEM DIRECT ACCESS \(DAX\)" <nvdimm@lists.linux.dev>,
 Hongbo Li <lihongbo22@huawei.com>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>,
 "open list:EROFS FILE SYSTEM" <linux-erofs@lists.ozlabs.org>,
 "open list:BTRFS FILE SYSTEM" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:gfs2@lists.linux.dev
 ,m:nvdimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,sony.com,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[frogsfrogsfrogs:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5C0B6FDC42

T24gVGh1LCBKdWwgMDIsIDIwMjYgYXQgMDU6MTc6MDJQTSAtMDcwMCwgSm9hbm5lIEtvb25nIHdy
b3RlOgo+IE9uIFRodSwgSnVsIDIsIDIwMjYgYXQgOTo1OOKAr0FNIERhcnJpY2sgSi4gV29uZyA8
ZGp3b25nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2lvbWFw
L2J1ZmZlcmVkLWlvLmMgYi9mcy9pb21hcC9idWZmZXJlZC1pby5jCj4gPiA+IGluZGV4IDNmMDkz
MmU0NmZkNi4uMGFhOGFiYzQzOGMxIDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9pb21hcC9idWZmZXJl
ZC1pby5jCj4gPiA+ICsrKyBiL2ZzL2lvbWFwL2J1ZmZlcmVkLWlvLmMKPiA+ID4gQEAgLTYyNiw3
ICs2MjYsNyBAQCBzdGF0aWMgaW50IGlvbWFwX3JlYWRfZm9saW9faXRlcihzdHJ1Y3QgaW9tYXBf
aXRlciAqaXRlciwKPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC12
b2lkIGlvbWFwX3JlYWRfZm9saW8oY29uc3Qgc3RydWN0IGlvbWFwX29wcyAqb3BzLAo+ID4gPiAr
dm9pZCBpb21hcF9yZWFkX2ZvbGlvKGlvbWFwX25leHRfZm4gaW9tYXBfbmV4dCwKPiA+Cj4gPiBJ
ZiB5b3UgdG9vayBteSBlYXJsaWVyIHN1Z2dlc3Rpb24gdG8gcmVuYW1lIHRoZSB0eXBlZGVmIHRv
Cj4gPiBpb21hcF9pdGVyX2ZuLCB0aGVuIHRoaXMgcGFyYW1ldGVyIG91Z2h0IHRvIGJlIG5hbWVk
IGl0ZXJfZm4uCj4gCj4gSG1tLi4uIG1heWJlIGF0IHRoYXQgcG9pbnQsIGl0J3Mgc2VsZi1leHBs
YW5hdG9yeSBlbm91Z2ggdGhhdCB0aGUgYXJnCj4gY291bGQganVzdCBiZSBjYWxsZWQgIml0ZXIi
IGluc3RlYWQgb2YgIml0ZXJfZm4iPwoKRHVubm8uICBTZWVpbmcgYXMgd2UgYWxyZWFkeSBoYXZl
IHZhcmlhYmxlcyBuYW1lZCAiaXRlciIgdGhhdCBhcmUgdGhlCmFjdHVhbCBpdGVyYXRpb24gc3Rh
dGUgb2JqZWN0LCBJIHRoaW5rIGl0J3MgY2xlYXJlciB0byBsZWF2ZSB0aGUKaXRlcmF0aW9uIGZ1
bmN0aW9uIGFzICJpdGVyX2ZuIi4KCj4gPgo+ID4gPiAgICAgICAgICAgICAgIHN0cnVjdCBpb21h
cF9yZWFkX2ZvbGlvX2N0eCAqY3R4LCB2b2lkICpwcml2YXRlKQo+ID4gPiAgewo+ID4gPiAgICAg
ICBzdHJ1Y3QgZm9saW8gKmZvbGlvID0gY3R4LT5jdXJfZm9saW87Cj4gPiA+IEBAIC02NTAsNyAr
NjUwLDcgQEAgdm9pZCBpb21hcF9yZWFkX2ZvbGlvKGNvbnN0IHN0cnVjdCBpb21hcF9vcHMgKm9w
cywKPiA+ID4gICAgICAgICAgICAgICBmc3Zlcml0eV9yZWFkYWhlYWQoY3R4LT52aSwgZm9saW8t
PmluZGV4LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19ucl9w
YWdlcyhmb2xpbykpOwo+ID4gPgo+ID4gPiAtICAgICB3aGlsZSAoKHJldCA9IGlvbWFwX2l0ZXIo
Jml0ZXIsIG9wcykpID4gMCkgewo+ID4gPiArICAgICB3aGlsZSAoKHJldCA9IGlvbWFwX2l0ZXIo
Jml0ZXIsIGlvbWFwX25leHQpKSA+IDApIHsKPiA+ID4gICAgICAgICAgICAgICBpdGVyLnN0YXR1
cyA9IGlvbWFwX3JlYWRfZm9saW9faXRlcigmaXRlciwgY3R4LAo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmYnl0ZXNfc3VibWl0dGVkKTsKPiA+ID4gICAgICAgICAgICAgICBp
b21hcF9yZWFkX3N1Ym1pdCgmaXRlciwgY3R4KTsKPiA+ID4gQEAgLTY4OCwyMiArNjg4LDIyIEBA
IHN0YXRpYyBpbnQgaW9tYXBfcmVhZGFoZWFkX2l0ZXIoc3RydWN0IGlvbWFwX2l0ZXIgKml0ZXIs
Cj4gPiA+Cj4gPiA+ICAvKioKPiA+ID4gICAqIGlvbWFwX3JlYWRhaGVhZCAtIEF0dGVtcHQgdG8g
cmVhZCBwYWdlcyBmcm9tIGEgZmlsZS4KPiA+ID4gLSAqIEBvcHM6IFRoZSBvcGVyYXRpb25zIHZl
Y3RvciBmb3IgdGhlIGZpbGVzeXN0ZW0uCj4gPiA+ICsgKiBAaW9tYXBfbmV4dDogVGhlIGlvbWFw
X25leHQgY2FsbGJhY2sgZm9yIHRoZSBmaWxlc3lzdGVtLgo+ID4KPiA+ICJUaGUgaW9tYXAgaXRl
cmF0aW9uIGZ1bmN0aW9uIGZvciB0aGUgZmlsZXN5c3RlbSIgPwo+ID4KPiA+IFVzaW5nIHRoZSB0
ZXJtICJpb21hcF9uZXh0IiBpbiB0aGUgZGVmaW5pdGlvbiBmb3IgaW9tYXBfbmV4dCBpc24ndCB0
aGF0Cj4gPiBoZWxwZnVsLgo+IAo+IEFncmVlZCwgSSdsbCByZXBsYWNlIHRoaXMgd2l0aCB5b3Vy
IHN1Z2dlc3Rpb24uCgo8bm9kPgoKPiA+Cj4gPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPiA+IEBA
IC04MjQsMTYgKzgyNCwxNiBAQCB4ZnNfZmlsZV9kaW9fd3JpdGVfYXRvbWljKAo+ID4gPiAgICAg
ICB1bnNpZ25lZCBpbnQgICAgICAgICAgICBpb2xvY2sgPSBYRlNfSU9MT0NLX1NIQVJFRDsKPiA+
ID4gICAgICAgc3NpemVfdCAgICAgICAgICAgICAgICAgcmV0LCBvY291bnQgPSBpb3ZfaXRlcl9j
b3VudChmcm9tKTsKPiA+ID4gICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAgZGlvX2ZsYWdz
ID0gMDsKPiA+ID4gLSAgICAgY29uc3Qgc3RydWN0IGlvbWFwX29wcyAgKmRvcHM7Cj4gPiA+ICsg
ICAgIGlvbWFwX25leHRfZm4gICAgICAgICAgIGRvcHM7Cj4gPiA+Cj4gPiA+ICAgICAgIC8qCj4g
PiA+ICAgICAgICAqIEhXIG9mZmxvYWQgc2hvdWxkIGJlIGZhc3Rlciwgc28gdHJ5IHRoYXQgZmly
c3QgaWYgaXQgaXMgYWxyZWFkeQo+ID4gPiAgICAgICAgKiBrbm93biB0aGF0IHRoZSB3cml0ZSBs
ZW5ndGggaXMgbm90IHRvbyBsYXJnZS4KPiA+ID4gICAgICAgICovCj4gPiA+ICAgICAgIGlmIChv
Y291bnQgPiB4ZnNfaW5vZGVfYnVmdGFyZyhpcCktPmJ0X2F3dV9tYXgpCj4gPiA+IC0gICAgICAg
ICAgICAgZG9wcyA9ICZ4ZnNfYXRvbWljX3dyaXRlX2Nvd19pb21hcF9vcHM7Cj4gPiA+ICsgICAg
ICAgICAgICAgZG9wcyA9IHhmc19hdG9taWNfd3JpdGVfY293X2lvbWFwX25leHQ7Cj4gPiA+ICAg
ICAgIGVsc2UKPiA+ID4gLSAgICAgICAgICAgICBkb3BzID0gJnhmc19kaXJlY3Rfd3JpdGVfaW9t
YXBfb3BzOwo+ID4gPiArICAgICAgICAgICAgIGRvcHMgPSB4ZnNfZGlyZWN0X3dyaXRlX2lvbWFw
X25leHQ7Cj4gPgo+ID4gUHJvYmFibHkgb3VnaHQgdG8gYmUgY2FsbGVkIGl0ZXJfZm4sIG9yIGF0
IGxlYXN0IHNvbWV0aGluZyB0aGF0IGlzbid0Cj4gPiAiZG9wcyIuCj4gCj4gTmljZSBzcG90dGlu
ZywgSSdsbCByZW5hbWUgdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPG5vZD4KCi0tRAoKPiBU
aGFua3MsCj4gSm9hbm5lCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
