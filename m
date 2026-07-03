Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bUG+CQKRR2o6bQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 12:37:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E5701495
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 03 Jul 2026 12:37:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=aMc65JeE;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=kXzTodc+;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=b0h+lHIA;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=W8LzFtRD;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-Id:Date:References:In-Reply-To:To:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuProDsuDqD1iCUJJZfCYi9kecQLAo0G79oNzNqlVpY=; b=aMc65JeESrVsuWpRda8WjdA//9
	9wPZuD19/NNFh+Joplb2Khaa+Vm8jNhVFulDd9zSNX3aCByxc5ow6HqX+jjN9d9jfQrJyYyaDtf+7
	ohmh5Uz+wX6WhVW69l31n1RaYvkCdmVFMOpFpkSQ3MffzZCslxwipB/gPPyna+7dQsgY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfbHC-0008D2-Jl;
	Fri, 03 Jul 2026 10:37:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1wfbHB-0008Cw-KK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 10:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:References:In-Reply-To:Cc:To:From:
 Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibq5yGoOYYUKiAiXchC0WA0gL3l+/26cw0R84LkFjaY=; b=kXzTodc+JbCE4mzJhyCztjvh3L
 E0NQYaNw0iPSxQ459c1LDmhGYFKceQ0FsxLgxtLL92UFqoqqtTVr9HpfIc0wsD25vOhGIj7goa3c/
 9CM7BmjUQJZF9rj7TlgyrRvJ1Mng23LPFXNgRLWfDSRhUUnEL+VCApRXqLwpc7/qbiNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-Id:Date:References:In-Reply-To:Cc:To:From:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibq5yGoOYYUKiAiXchC0WA0gL3l+/26cw0R84LkFjaY=; b=b0h+lHIA7mDtecT4V8jHu/3/QA
 gXloxv8XX/DTWR9nd1I+fYRgxSHTDgRXKh05Tbor8z4CLQCrOkdkAbk+Ah3bmL7lGj99Ahe3raafA
 wt4ah1qSOEp4a4khy0rJNNlxq3XrIIbaRj9E8BdAzbV/4sqDWFrwyNyc5toXmsimP1ek=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfbH7-0002xz-Vo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jul 2026 10:37:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B4B7601C2;
 Fri,  3 Jul 2026 10:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CFA1F000E9;
 Fri,  3 Jul 2026 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783075047;
 bh=ibq5yGoOYYUKiAiXchC0WA0gL3l+/26cw0R84LkFjaY=;
 h=Subject:From:To:Cc:In-Reply-To:References:Date;
 b=W8LzFtRDEJ+LA4ga+f6QzIP5wIjhPrvbgSkeN5H9fdUp8ldRpYac+VP2pbFWqLIaZ
 VOZRYcIErzh7ZZVI1opgKNPyPdXZNYzLlXZRZvIfpIEGsP8CRSvmh6dp1f1DUAQ8eT
 REmssNKn6FgP95Nylwk1jyDskOejoq/ZtxJV6+SZMcueW6AmnmkTRlSc0afIY2ZaY4
 0j6EQgUmekHKxLsbkP1RtsOiATrm0qsMc/rLKl6p2+xyg60HQXm8THGcRmHmGEbsA5
 +KIVTrOUxI8EdD77tZ08aAlBNDaVgctnhdPNMu6u++MTrLUeeidjuDh4Pwu7QdGwKu
 L34A4eoQ9xeiA==
MIME-Version: 1.0
To: Joanne Koong <joannelkoong@gmail.com>
In-Reply-To: <CAJnrk1b8j5WHtbHOWNXc4=QBFOxde1f2QxTOeui7Ta8O-xWcTA@mail.gmail.com>
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-18-joannelkoong@gmail.com>
 <20260702140705.GE21339@lst.de> <20260702165117.GK9392@frogsfrogsfrogs>
 <CAJnrk1b8j5WHtbHOWNXc4=QBFOxde1f2QxTOeui7Ta8O-xWcTA@mail.gmail.com>
Date: Fri, 03 Jul 2026 12:37:14 +0200
Message-Id: <20260703-nachrangig-gegeben-befestigen-8219a53648c7@brauner>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=brauner@kernel.org;
 h=from:subject:message-id; bh=d4s4dMLniDIuK4LTsTNvbrHzQ5sC7wrFJBhb2lMg/u0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS5T7iz7fS6t1kzwm8fcparv3KDyXRbpMKKF15fNPbwT
 dVe5OMk1lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRtgxGhmMbHf76zT147eA7
 nZiMnzu9Q+v+PNtl5pjYUP6f6/XP/z8YGe7siubVVw14xJBz7G+cn2VOrNK0S08/rfgQ3Ddj8wq
 eCi4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-07-02 18:47 -0700, Joanne Koong wrote: > On Thu, Jul
 2, 2026 at 9:51 AM Darrick J. Wong <djwong@kernel.org> wrote: > > > > On
 Thu, Jul 02, 2026 at 04:07:05PM +0200, Christoph Hellwig wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wfbH7-0002xz-Vo
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Jan Kara <jack@suse.cz>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 "Darrick J. Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Chunhai Guo <guochunhai@vivo.com>, Dan Williams <djbw@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Zhang Yi <yi.zhang@huawei.com>,
 willy@infradead.org, Christoph Hellwig <hch@lst.de>,
 Yuezhang Mo <yuezhang.mo@sony.com>, hsiangkao@linux.alibaba.com,
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
	FORGED_RECIPIENTS(0.00)[m:joannelkoong@gmail.com,m:ritesh.list@gmail.com,m:jack@suse.cz,m:mikulas@artax.karlin.mff.cuni.cz,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:almaz.alexandrovich@paragon-software.com,m:clm@fb.com,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:guochunhai@vivo.com,m:djbw@kernel.org,m:naohiro.aota@wdc.com,m:zbestahu@gmail.com,m:miklos@szeredi.hu,m:yi.zhang@huawei.com,m:willy@infradead.org,m:hch@lst.de,m:yuezhang.mo@sony.com,m:hsiangkao@linux.alibaba.com,m:xiang@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:jefflexu@linux.alibaba.com,m:jaegeuk@kernel.org,m:agruenba@redhat.com,m:axboe@kernel.dk,m:fuse-devel@lists.linux.dev,m:brauner@kernel.org,m:jth@kernel.org,m:tytso@mit.edu,m:ntfs3@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:
 gfs2@lists.linux.dev,m:nvdimm@lists.linux.dev,m:lihongbo22@huawei.com,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,m:riteshlist@gmail.com,m:hyclee@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.cz,artax.karlin.mff.cuni.cz,kernel.org,paragon-software.com,fb.com,dilger.ca,linux.ibm.com,linux.alibaba.com,vivo.com,wdc.com,szeredi.hu,huawei.com,infradead.org,lst.de,sony.com,vger.kernel.org,suse.com,zeniv.linux.org.uk,redhat.com,kernel.dk,lists.linux.dev,mit.edu,lists.sourceforge.net,samsung.com,lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brauner:mid,lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 526E5701495

T24gMjAyNi0wNy0wMiAxODo0NyAtMDcwMCwgSm9hbm5lIEtvb25nIHdyb3RlOgo+IE9uIFRodSwg
SnVsIDIsIDIwMjYgYXQgOTo1MeKAr0FNIERhcnJpY2sgSi4gV29uZyA8ZGp3b25nQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDA0OjA3OjA1UE0gKzAy
MDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBMb29rcyBnb29kOgo+ID4gPgo+ID4g
PiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiA+Cj4gPiA+
IEluIHRlcm1zIG9mIG1lcmdlIGxvZ2lzdGljcywgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGRlbGF5
IHRoaXMgYW5kCj4gPiA+IHRoZSBwcmV2aW91cyBwYXRjaCB0byB0aGUgbmV4dCBtZXJnZSB3aW5k
b3cgc28gdGhhdCB3ZSBjYW4gbWluaW1pemUgdGhlCj4gPiA+IGNyb3NzLXN1YnN5c3RlbSBtZXJn
ZSBwYWluIHdpdGggbW9yZSBmaWxlIHN5c3RlbSBpb21hcCBjb252ZXJzaW9uLgo+ID4gPiBJZiBu
b25lIG9mIHRoZW0gYWN0dWFsbHkgaGFwcGVuIHVudGlsIHJjNiBvciBzbywgb3JpZiAgdGhlIG1l
cmdlcyBhcmVuJ3QKPiA+ID4gcGFpbmZ1bCB3ZSBjb3VsZCBzdGlsbCBwaWNrIHRoZW0gdXAgbGF0
ZSBpbiB0aGUgbWVyZ2Ugd2luZG93Lgo+ID4KPiA+IEknZCBzYXkgZXZlcnl0aGluZyBidXQgdGhp
cyBwYXRjaCBzaG91bGQgZ28gaW4gZHVyaW5nIHRoZSBtZXJnZSB3aW5kb3cKPiA+IGZvciA3LjMs
IGFsb25nIHdpdGggY2xlYXIgaW5zdHJ1Y3Rpb25zIHRvIGJyYXVuZXIvdG9ydmFsZHMgdG8gZXhw
ZWN0Cj4gPiB0aGlzIHBhdGNoIHRvIGFwcGVhciByaWdodCBiZWZvcmUgNy4zLXJjMSBnZXRzIHRh
Z2dlZCwgdG8gY2xlYW4gdXAgYWxsCj4gPiB0aGUgb3RoZXIgY2hhbmdlcyB0aGF0IGNvbWUgaW4u
Cj4gCj4gSnVzdCB0byBjbGFyaWZ5LCBkaWQgeW91IG1lYW4gdGhpcyBwYXRjaCBhbmQgdGhlIHBy
ZXZpb3VzIG9uZT8gSWYgaSdtCj4gaW50ZXJwcmV0aW5nIENocmlzdG9waCdzIGNvbmNlcm4gY29y
cmVjdGx5LCBJIHRoaW5rIGhlJ3Mgd29ycmllZCBhYm91dAo+IG90aGVyIGZpbGVzeXN0ZW1zIGNv
bnZlcnRpbmcgdG8gaW9tYXAgdXNpbmcgdGhlIC0+aW9tYXBfYmVnaW4oKSAvCj4gLT5pb21hcF9l
bmQoKSBmdW5jdGlvbnMgc3RpbGw/IFRoYXQgc291bmRzIGxpa2UgYSBnb29kIHBsYW4gdG8gbWUs
IGZvcgo+IHYzIEknbGwgc3VibWl0IGV2ZXJ5dGhpbmcgYnV0IHRoaXMgcGF0Y2ggYW5kIHRoZSBs
YXN0IG9uZSBhbmQgdGhlbgoKT2ssIHNvIHdlJ2xsIGRvIHRoZSBwcmVwIGZvciB2ZnMtNy4zLmlv
bWFwIChha2EgdG8gYmUgbWVyZ2VkIGluIHRoZQp2Ny4zLXJjMSBjeWNsZSkuLi4KCj4gc3VibWl0
IHRoZXNlIHBhdGNoZXMgKGFuZCBhbnkgY2xlYW51cCBvbmVzIHRoYXQgYmVjb21lIG5lY2Vzc2Fy
eSkgdG8KPiBDaHJpc3RpYW4gcmlnaHQgYmVmb3JlIDcuMy1yYzEgZ2V0cyB0YWdnZWQgKHdoaWNo
IGFzIEkgdW5kZXJzdGFuZCBpdCwKPiBpcyB3aGVuIHRoZSBtZXJnZSB3aW5kb3cgaXMgYWJvdXQg
dG8gY2xvc2UpLgoKYW5kIG1lcmdlIHRoZXNlIF9hZnRlcl8gdjcuMy1yYzEgaGFzIGJlZW4gdGFn
Z2VkLi4uCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
