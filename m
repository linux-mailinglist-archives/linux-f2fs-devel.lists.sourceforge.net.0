Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK3MORFPcGlvXQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 04:59:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C47650B58
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jan 2026 04:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vudPuigikY0Iog1awhE4K/2JZWPeiSwySlYAKSCmwYw=; b=lct+GMv6KLQih2oUeVeNZdajsP
	41otJ89Be10JczX+HqwreOzX+0WDpd65h0ZKT+5mtB5C7tGWUrr+6hQ8umStIVotnd546GP49tvJ0
	FqyiPfYv98z8fcnHjRohPYrP9H3uDM88E9qwz/Um5u3iOxFREip5QIOiU9mc4CyQfpv4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viPMy-0003Vy-83;
	Wed, 21 Jan 2026 03:59:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1viPMw-0003Vh-Bw;
 Wed, 21 Jan 2026 03:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HPgiNusZcZTF/ZTl66piD/9BsmWo5Gc2+jAKaL+zbjo=; b=Dhp637JCj54gsW8dbjAJ/ajmzr
 R0+9+7dwubj3PKXA+HTq6N/Bs/yWCCBnj32IKhC0jU7y+vd7OFCH57OggKl8T9LZRFT61VYz5oHyd
 gCv0OCM5O52/hzldkoFyIf4Ihh+SCOUoyzvsdn6V6RmgTZqO4AE6oS5ra7wx4VHJxXvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HPgiNusZcZTF/ZTl66piD/9BsmWo5Gc2+jAKaL+zbjo=; b=ByBQnCMAGLaT4QefMZQrbg201s
 yCX+OtTCE06jc0CYjIpZqngJRyoi+Rax8VzRFejyLokU4F0lv1rGSZqAG6Ur57ceKTA4wvUKMlrMC
 QNYdSnbMVEBG6GT6Iii1nV5zYAuiLm/UnP34e00UWHV/1A8Cf8zph498Gdgs6KYe1H6w=;
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viPMv-0006KV-5v; Wed, 21 Jan 2026 03:58:58 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.phl.internal (Postfix) with ESMTP id 59F6C1380787;
 Tue, 20 Jan 2026 22:58:51 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 20 Jan 2026 22:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768967931; x=1768975131; bh=HPgiNusZcZTF/ZTl66piD/9BsmWo5Gc2+jA
 KaL+zbjo=; b=YYEr2VjWIaKtDqIQ9vfEWExooQB7WdoWCHPbIyCUEJI6BAxeQcQ
 Lbk8vsbd4GXH0kYHJaGcChinGdfj9GfFjBP2dVOEb1g7c0vP40XWPDTq6qbmdX+f
 q8U4adtBeg5EFoL6E5HUF62j7hOUy4j8XFCT0i4fYg4se8kZH51qgrZqOSAUlTga
 rl7CFzO8J+PeDJ7M2JSUWHisN0sDH8S0NMXRz8qdtkwm9W98zD3C3gklDbkWIXrK
 vRegxtY4BxrRjprMIjBdoVNMCKrXQqfmvm/+rjsgzuPUZ23gzBTcc6UXYC33cLAY
 vFj8n0R7qJgD5zcyYlJT/0wZ8oNx4to8Sng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768967931; x=
 1768975131; bh=HPgiNusZcZTF/ZTl66piD/9BsmWo5Gc2+jAKaL+zbjo=; b=Y
 4kSyYfnUGNoNeVLU3ka40YnKW2sl+45SitUqyg7vTCZpQcxFqZev1sh8sHAo4DzB
 LJJuIPm7kr1a2T2O/jCPPqyfpx1RyAZnMeJxrzQuzh0MJ2v9HwC0x1U/ypjUALTY
 LkBS/sHDc8LkvX0vZjnTUcBNoleBEEaONsgjyNXSYbPCsyTNNhNqwnjeRYEYWhC0
 Keyf4hXJLJ2uIP8nM1JZTI64DK90fYZcMdZmLKhtCiDOLF6zK0pOuLIFL3efcAnh
 U7QNK8cCXtqL4iHqmwf38GI0o4feHmUs9gVmK1fgy3LCnOLy087fTAjf+2UjG0tL
 Zxk2nmIhddHGej/ASyZkw==
X-ME-Sender: <xms:9k5waa6xGMlhNWG7OiNFHfIpLvabWA1DAPtyEn94taKAb8B-mUoW7w>
 <xme:9k5waRR7ItrMgf6WBso9qWSvOzTjS1gqDa4US3nP2_YPOGpBhCwjdwQRddvH-EWFV
 V57p5_-4xzEl4CNusEssTAjoVs4ZFelbrYFxoXbJ50yHbQn>
X-ME-Received: <xmr:9k5waeoZsLXtAC9WGWMpKfuL6jcuFf0eBU9OKagBSlfpxrmBa-z1UpdKQRgAi22TvEjMRNRptGtFkHbPbhda8VF8Vv99_8wlEjUQv-qrj4y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedvvdeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepjedvpdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepghhuohgthhhunhhhrghisehvihhvohdrtghomhdprhgtphhtthhopehl
 ihhnuhigqdigfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
 hugidquhhnihhonhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
 ihhnuhigqdhnihhlfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
 hinhhugidqnhhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
 uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
 hnuhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 lhhinhhugidqvgigthegsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9k5waUhf0LUODlL_PQYsCPf5h1Hz9YtKoS8AL4OAL0YUoX9vGv32rg>
 <xmx:905waSCsyLL7f6fuPyvb6LM-a8AMULf8pIsT5TNPUcN888plxn2vJQ>
 <xmx:905waT9XbBSmLAgfzGT6kRdfvn_ApgSn62i1cNhe3-zAYtSYAOgBDQ>
 <xmx:905waTEUm6W92v2m08NAsDI3Dm--lHbflm-x_CKDQ7Y36cOw-DiEBA>
 <xmx:-05waa7eNM5AFWgAvsYRXTN-gn5rTHGxvGEPMtNHM76v4SM6_x2afNUS>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 22:58:29 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <a35ac736d9ebc6c92a6e7d61aeb5198234102442.camel@kernel.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>,
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>,
 <aW3SAKIr_QsnEE5Q@infradead.org>,
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>,
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>,
 <176885553525.16766.291581709413217562@noble.neil.brown.name>,
 <20260120-entmilitarisieren-wanken-afd04b910897@brauner>,
 <176890211061.16766.16354247063052030403@noble.neil.brown.name>,
 <20260120-hacken-revision-88209121ac2c@brauner>,
 <a35ac736d9ebc6c92a6e7d61aeb5198234102442.camel@kernel.org>
Date: Wed, 21 Jan 2026 14:58:25 +1100
Message-id: <176896790525.16766.11792073987699294594@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 20 Jan 2026, Jeff Layton wrote: > On Tue, 2026-01-20
 at 11:31 +0100, Christian Brauner wrote: > > On Tue, Jan 20, 2026 at 08:41:50PM
 +1100, NeilBrown wrote: > > > On Tue, 20 Jan 2026, Christia [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1viPMv-0006KV-5v
Subject: Re: [f2fs-dev] [PATCH 00/29] fs: require filesystems to explicitly
 opt-in to nfsd export support
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
Reply-To: NeilBrown <neil@brown.name>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[ownmail.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,ownmail.net:s=fm2,messagingengine.com:s=fm2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCPT_COUNT_GT_50(0.00)[71];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[omnibond.com,lists.sourceforge.net,suse.cz,manguebit.org,redhat.com,google.com,vger.kernel.org,kernel.org,gmail.com,paragon-software.com,fb.com,dilger.ca,vivo.com,lists.infradead.org,szeredi.hu,nod.at,fasheh.com,oracle.com,infradead.org,dubeyko.com,kvack.org,lists.orangefs.org,microsoft.com,talpey.com,lists.linux.dev,suse.com,zeniv.linux.org.uk,linux.alibaba.com,mail.parknet.co.jp,mit.edu,lists.ozlabs.org,samba.org,huawei.com,squashfs.org.uk,linux-foundation.org,evilplan.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,ownmail.net:-,messagingengine.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noble.neil.brown.name:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 0C47650B58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCAyMCBKYW4gMjAyNiwgSmVmZiBMYXl0b24gd3JvdGU6Cj4gT24gVHVlLCAyMDI2LTAx
LTIwIGF0IDExOjMxICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90ZToKPiA+IE9uIFR1ZSwg
SmFuIDIwLCAyMDI2IGF0IDA4OjQxOjUwUE0gKzExMDAsIE5laWxCcm93biB3cm90ZToKPiA+ID4g
T24gVHVlLCAyMCBKYW4gMjAyNiwgQ2hyaXN0aWFuIEJyYXVuZXIgd3JvdGU6Cj4gPiA+ID4gT24g
VHVlLCBKYW4gMjAsIDIwMjYgYXQgMDc6NDU6MzVBTSArMTEwMCwgTmVpbEJyb3duIHdyb3RlOgo+
ID4gPiA+ID4gT24gTW9uLCAxOSBKYW4gMjAyNiwgQ2hyaXN0aWFuIEJyYXVuZXIgd3JvdGU6Cj4g
PiA+ID4gPiA+IE9uIE1vbiwgSmFuIDE5LCAyMDI2IGF0IDA2OjIyOjQyUE0gKzExMDAsIE5laWxC
cm93biB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBNb24sIDE5IEphbiAyMDI2LCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgSmFuIDE5LCAyMDI2IGF0IDEw
OjIzOjEzQU0gKzExMDAsIE5laWxCcm93biB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlz
IHdhcyBDaHVjaydzIHN1Z2dlc3RlZCBuYW1lLiBIaXMgcG9pbnQgd2FzIHRoYXQgU1RBQkxFIG1l
YW5zIHRoYXQKPiA+ID4gPiA+ID4gPiA+ID4gPiB0aGUgRkgncyBkb24ndCBjaGFuZ2UgZHVyaW5n
IHRoZSBsaWZldGltZSBvZiB0aGUgZmlsZS4KPiA+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiA+ID4gPiBJIGRvbid0IG11Y2ggY2FyZSBhYm91dCB0aGUgZmxhZyBuYW1lLCBzbyBpZiBl
dmVyeW9uZSBsaWtlcyBQRVJTSVNURU5UCj4gPiA+ID4gPiA+ID4gPiA+ID4gYmV0dGVyIEknbGwg
cm9sbCB3aXRoIHRoYXQuCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gPiBJIGRv
bid0IGxpa2UgUEVSU0lTVEVOVC4KPiA+ID4gPiA+ID4gPiA+ID4gSSdkIHJhdGhlciBjYWxsIGEg
c3BhZGUgYSBzcGFkZS4KPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+ICAgRVhQ
T1JUX09QX1NVUFBPUlRTX05GU19FWFBPUlQKPiA+ID4gPiA+ID4gPiA+ID4gb3IKPiA+ID4gPiA+
ID4gPiA+ID4gICBFWFBPUlRfT1BfTk9UX05GU19DT01QQVRJQkxFCj4gPiA+ID4gPiA+ID4gPiA+
IAo+ID4gPiA+ID4gPiA+ID4gPiBUaGUgaXNzdWUgaGVyZSBpcyBORlMgZXhwb3J0IGFuZCBpbmRp
cmVjdGlvbiBkb2Vzbid0IGJyaW5nIGFueSBiZW5lZml0cy4KPiA+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+ID4gTm8sIGl0IGFic29sdXRlbHkgaXMgbm90LiAgQW5kIHRoZSB3aG9sZSBjb25j
ZXB0IG9mIGNhbGxpbmcgc29tZXRoaW5nCj4gPiA+ID4gPiA+ID4gPiBhZnRlciB0aGUgaW5pdGlh
bCBvciBtYWluIHVzZSBpcyBhIHJlY2lwZSBmb3IgYSBtZXNzLgo+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+IFdlIGFyZSBjYWxsaW5nIGl0IGZvciBpdCdzIG9ubHkgdXNlLiAgSWYgdGhlcmUg
d2FzIGV2ZXIgYW5vdGhlciB1c2UsIHdlCj4gPiA+ID4gPiA+ID4gY291bGQgY2hhbmdlIHRoZSBu
YW1lIGlmIHRoYXQgbWFkZSBzZW5zZS4gIEl0IGlzIG5vdCBhIHB1YmxpYyBuYW1lLCBpdAo+ID4g
PiA+ID4gPiA+IGlzIGVhc3kgdG8gY2hhbmdlLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+ID4gPiBQaWNrIGEgbmFtZSB0aGF0IGNvbnZleXMgd2hhdCB0aGUgZmxh
ZyBpcyBhYm91dCwgYW5kIGRvY3VtZW50IHRob3NlCj4gPiA+ID4gPiA+ID4gPiBzZW1hbnRpY3Mg
d2VsbC4gIFRoaXMgZmxhZyBpcyBhYm91dCB0aGUgZmFjdCB0aGF0IGZvciBhIGdpdmVuIGZpbGUs
Cj4gPiA+ID4gPiA+ID4gPiBhcyBsb25nIGFzIHRoYXQgZmlsZSBleGlzdHMgaW4gdGhlIGZpbGUg
c3lzdGVtIHRoZSBoYW5kbGUgaXMgc3RhYmxlLgo+ID4gPiA+ID4gPiA+ID4gQm90aCBzdGFibGUg
YW5kIHBlcnNpc3RlbnQgYXJlIHN1aXRhYmxlIGZvciB0aGF0LCBuZnMgaXMgZXZlcnl0aGluZwo+
ID4gPiA+ID4gPiA+ID4gYnV0Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE15IHVuZGVy
c3RhbmRpbmcgaXMgdGhhdCBrZXJuZnMgd291bGQgbm90IGdldCB0aGUgZmxhZy4KPiA+ID4gPiA+
ID4gPiBrZXJuZnMgZmlsZWhhbmRsZXMgZG8gbm90IGNoYW5nZSBhcyBsb25nIGFzIHRoZSBmaWxl
IGV4aXN0Lgo+ID4gPiA+ID4gPiA+IEJ1dCB0aGlzIGlzIG5vdCBzdWZmaWNpZW50IGZvciB0aGUg
ZmlsZXMgdG8gYmUgdXNlZnVsbHkgZXhwb3J0ZWQuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ID4gSSBzdXNwZWN0IGtlcm5mcyBkb2VzIHJlLXVzZSBmaWxlaGFuZGxlcyByZWxhdGl2ZWx5IHNv
b24gYWZ0ZXIgdGhlCj4gPiA+ID4gPiA+ID4gZmlsZS9vYmplY3QgaGFzIGJlZW4gZGVzdHJveWVk
LiAgTWF5YmUgdGhhdCBpcyB0aGUgcmVhbCBwcm9ibGVtIGhlcmU6Cj4gPiA+ID4gPiA+ID4gZmls
ZWhhbmRsZSByZXVzZSwgbm90IGZpbGVoYW5kbGUgc3RhYmlsaXR5Lgo+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+IEplZmY6IGNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBkZXRhaWxzIChhbmQgcHJl
c2VydmUgdGhlbSBpbiBmdXR1cmUgY292ZXIKPiA+ID4gPiA+ID4gPiBsZXR0ZXJzKSBvZiB3aGlj
aCBmaWxlc3lzdGVtcyBhcmUga25vd24gdG8gaGF2ZSBwcm9ibGVtcyBhbmQgd2hhdAo+ID4gPiA+
ID4gPiA+IGV4YWN0bHkgdGhvc2UgcHJvYmxlbXMgYXJlPwo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBSZW1lbWJlciBuZnMgYWxzbyBzdXBwb3J0IHZvbGF0
aWxlIGZpbGUgaGFuZGxlcywgYW5kIG90aGVyIGFwcGxpY2F0aW9ucwo+ID4gPiA+ID4gPiA+ID4g
bWlnaHQgcmVseSBvbiB0aGlzIChJIGtub3cgb2YgcXVpdGUgYSBmZXcgdXNlciBzcGFjZSBhcHBs
aWNhdGlvbnMgdGhhdAo+ID4gPiA+ID4gPiA+ID4gZG8sIGJ1dCB0aGV5IGFyZSBraW5kYSBoYXJk
d2lyZWQgdG8geGZzIGFueXdheSkuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhlIE5G
UyBwcm90b2NvbCBzdXBwb3J0cyB2b2xhdGlsZSBmaWxlIGhhbmRsZXMuICBrbmZzZCBkb2VzIG5v
dC4KPiA+ID4gPiA+ID4gPiBTbyBtYXliZQo+ID4gPiA+ID4gPiA+ICAgRVhQT1JUX09QX05PVF9O
RlNEX0NPTVBBVElCTEUKPiA+ID4gPiA+ID4gPiBtaWdodCBiZSBiZXR0ZXIuICBvciBFWFBPUlRf
T1BfTk9UX0xJTlVYX05GU0RfQ09NUEFUSUJMRS4KPiA+ID4gPiA+ID4gPiAoSSBwcmVmZXIgb3B0
LW91dCByYXRoZXIgdGhhbiBvcHQtaW4gYmVjYXVzZSBuZnNkIGV4cG9ydCB3YXMgdGhlCj4gPiA+
ID4gPiA+ID4gb3JpZ2luYWwgcHVycG9zZSBvZiBleHBvcnRfb3BlcmF0aW9ucywgYnV0IGl0IGlz
bid0IHNvbWV0aGluZwo+ID4gPiA+ID4gPiA+IEkgd291bGQgZmlnaHQgZm9yKQo+ID4gPiA+ID4g
PiAKPiA+ID4gPiA+ID4gSSBwcmVmZXIgb25lIG9mIHRoZSB2YXJpYW50cyB5b3UgcHJvcG9zZWQg
aGVyZSBidXQgSSBkb24ndCBwYXJ0aWN1bGFybHkKPiA+ID4gPiA+ID4gY2FyZS4gSXQncyBub3Qg
YSBoaWxsIHdvcnRoIGR5aW5nIG9uLiBTbyBpZiBDaHJpc3RvcGggaW5zaXN0cyBvbiB0aGUKPiA+
ID4gPiA+ID4gb3RoZXIgbmFtZSB0aGVuIEkgc2F5IGxldCdzIGp1c3QgZ28gd2l0aCBpdC4KPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgc291bmRzIGxpa2UgeW91IGFyZSBy
ZWNvbW1lbmRpbmcgdGhhdCB3ZSBnaXZlIGluIHRvIGJ1bGx5aW5nLgo+ID4gPiA+ID4gSSB3b3Vs
ZCByYXRoZXIgdGhlIGRlY2lzaW9uIGJlIG1hZGUgYmFzZWQgb24gdGhlIGZhY3RzIG9mIHRoZSBj
YXNlLCBub3QKPiA+ID4gPiA+IHRoZSBvcGluaW9ucyB0aGF0IGFyZSBzdGF0ZWQgbW9zdCBibHVu
dGx5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGFjdHVhbGx5IHRoaW5rIHRoYXQgd2hhdCBDaHJp
c3RvcGggd2FudHMgaXMgYWN0dWFsbHkgcXVpdGUgZGlmZmVyZW50Cj4gPiA+ID4gPiBmcm9tIHdo
YXQgSmVmZiB3YW50cywgYW5kIG1heWJlIHR3byBmbGFncyBhcmUgbmVlZGVkLiAgQnV0IEkgZG9u
J3QgeWV0Cj4gPiA+ID4gPiBoYXZlIGEgY2xlYXIgdW5kZXJzdGFuZGluZyBvZiB3aGF0IENocmlz
dG9waCB3YW50cywgc28gSSBjYW5ub3QgYmUgc3VyZS4KPiA+ID4gPiAKPiA+ID4gPiBJJ3ZlIHRy
aWVkIHRvIGluZGlyZWN0bHkgYXNrIHdoZXRoZXIgeW91IHdvdWxkIGJlIHdpbGxpbmcgdG8gY29t
cHJvbWlzZQo+ID4gPiA+IGhlcmUgb3Igd2hldGhlciB5b3Ugd2FudCB0byBpbnNpc3Qgb24geW91
ciBhbHRlcm5hdGl2ZSBuYW1lLiBBcHBhcmVudGx5Cj4gPiA+ID4gdGhhdCBkaWRuJ3QgY29tZSB0
aHJvdWdoLgo+ID4gPiAKPiA+ID4gVGhpcyB3b3VsZCBiZSB0aGUgIm5vdCBhIGhpbGwgd29ydGh5
IGR5aW5nIG9uIiBwYXJ0IG9mIHlvdXIgc3RhdGVtZW50Lgo+ID4gPiBJIHRoaW5rIEkgc2VlIHRo
YXQgaW1wbGljYXRpb24gbm93Lgo+ID4gPiBCdXQgbm8sIEkgZG9uJ3QgdGhpbmsgY29tcHJvbWlz
ZSBpcyByZWxldmFudC4gIEkgdGhpbmsgdGhlIHByb2JsZW0KPiA+ID4gc3RhdGVtZW50IGFzIG9y
aWdpbmFsbHkgZ2l2ZW4gYnkgSmVmZiBpcyBtaXNsZWFkaW5nLCBhbmQgcGVvcGxlIGhhdmUKPiA+
ID4gYmVlbiBtaXNsZWQgdG8gYW4gaW5jb3JyZWN0IG5hbWUuCj4gPiA+IAo+ID4gPiA+IAo+ID4g
PiA+IEknbSB1bmNsZWFyIHdoYXQgeW91ciBnb2FsIGlzIGluIHN1Z2dlc3RpbmcgdGhhdCBJIHJl
Y29tbWVuZCAid2UiIGdpdmUKPiA+ID4gPiBpbnRvIGJ1bGx5aW5nLiBBbGwgaXQgYWNoaWV2ZWQg
d2FzIHRvIGZ1cnRoZXIgZGVyYWlsIHRoaXMgdGhyZWFkLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4g
VGhlICJXZSIgaXMgdGhlIHNhbWUgYXMgdGhlICJ1cyIgaW4gImxldCdzIGp1c3QgZ28gd2l0aCBp
dCIuCj4gPiA+IAo+ID4gPiAKPiA+ID4gPiBJIGFsc28gdGhpbmsgaXQncyBub3QgdmVyeSBoZWxw
ZnVsIGF0IHY2IG9mIHRoZSBkaXNjdXNzaW9uIHRvIHN0YXJ0Cj4gPiA+ID4gZmlndXJpbmcgb3V0
IHdoYXQgdGhlIGFjdHVhbCBrZXkgcmlmdCBiZXR3ZWVuIEplZmYncyBhbmQgQ2hyaXN0b3BoJ3MK
PiA+ID4gPiBwb3NpdGlvbiBpcy4gSWYgeW91J3ZlIGZpZ3VyZWQgaXQgb3V0IGFuZCBnb3R0ZW4g
YW4gYWdyZWVtZW50IGFuZCB0aGlzCj4gPiA+ID4gaXMgYWxyZWFkeSBpbiwgc2VuZCBhIGZvbGxv
dy11cCBzZXJpZXMuCj4gPiA+IAo+ID4gPiB2Nj8gIHYyIHdhcyBwb3N0ZWQgdG9kYXkuICBCdXQg
bWF5YmUgeW91IGFyZSByZWZlcnJpbmcgdGhlIHNvbWUgb3RoZXIKPiA+ID4gcHJlY3Vyc29ycy4K
PiA+ID4gCj4gPiA+IFRoZSBpbnRyb2R1Y3Rvcnkgc3RhdGVtZW50IGluIHYyIGlzCj4gPiA+IAo+
ID4gPiAgICBUaGlzIHBhdGNoc2V0IGFkZHMgYSBmbGFnIHRoYXQgaW5kaWNhdGVzIHdoZXRoZXIg
dGhlIGZpbGVzeXN0ZW0gc3VwcG9ydHMKPiA+ID4gICAgc3RhYmxlIGZpbGVoYW5kbGVzIChpLmUu
IHRoYXQgdGhleSBkb24ndCBjaGFuZ2Ugb3ZlciB0aGUgbGlmZSBvZiB0aGUKPiA+ID4gICAgZmls
ZSkuIEl0IHRoZW4gbWFrZXMgYW55IGZpbGVzeXN0ZW0gdGhhdCBkb2Vzbid0IHNldCB0aGF0IGZs
YWcKPiA+ID4gICAgaW5lbGlnaWJsZSBmb3IgbmZzZCBleHBvcnQuCj4gPiA+IAo+ID4gPiBOb2Jv
ZHkgZWxzZSBxdWVzdGlvbmVkIHRoZSB2YWxpZGl0eSBvZiB0aGF0LiAgSSBkby4KPiA+ID4gTm8g
ZXZpZGVuY2Ugd2FzIGdpdmVuIHRoYXQgdGhlcmUgYXJlICphbnkqIGZpbGVzeXN0ZW1zIHRoYXQg
ZG9uJ3QKPiA+ID4gc3VwcG9ydCBzdGFibGUgZmlsZWhhbmRsZXMuICBUaGUgb25seSBmaWxlc3lz
dGVtIG1lbnRpb25lZCBpcyBjZ3JvdXBzCj4gPiA+IGFuZCBpdCBET0VTIHByb3ZpZGUgc3RhYmxl
IGZpbGVoYW5kbGVzLgo+ID4gCj4gCj4gQWNyb3NzIHJlYm9vdD8gTm90IHJlYWxseS4KCkFjcm9z
cyByZWJvb3QgYWxsIHRoZSBmaWxlcyBhcmUgZGVsZXRlZCBhbmQgdGhlbiBuZXcgb25lcyBhcmUg
Y3JlYXRlZC4KU28gdGhlcmUgaXMgbm90aGluZyB0aGF0IG5lZWRzIHRvIGJlIHN0YWJsZS4KCj4g
Cj4gSXQncyBxdWl0ZSBwb3NzaWJsZSB0aGF0IHdlIG1heSBlbmQgdXAgd2l0aCB0aGUgc2FtZSAi
aWQiIG51bWJlcnMgaW4KPiBjZ3JvdXBmcyBvbiBhIG5ldyBpbmNhcm5hdGlvbiBvZiB0aGUgZmls
ZXN5c3RlbSBhZnRlciBhIHJlYm9vdC4gVGhlCj4gZmlsZXMgaW4gdGhlcmUgYXJlIG5vdCB0aGUg
c2FtZSBvbmVzIGFzIHRoZSBvbmVzIGJlZm9yZSwgYnV0IHRoZWlyCj4gZmlsZWhhbmRsZXMgbWF5
IG1hdGNoIGJlY2F1c2Uga2VybmZzIGRvZXNuJ3QgZmFjdG9yIGluIGFuIGlfZ2VuZXJhdGlvbgo+
IG51bWJlci4KClRoYXQgaXMgaXMgYWJvdXQgZmlsZWhhbmRsZSByZS11c2UsIG5vdCBhYm91dCBm
aWxlaGFuZGxlIHN0YWJpbGl0eS4KCj4gCj4gQ291bGQgd2UgZml4IGl0IGJ5IGFkZGluZyBhIHJh
bmRvbSBpX2dlbmVyYXRpb24gdmFsdWUgb3Igc29tZXRoaW5nPwo+IFBvc3NpYmx5LCBidXQgdGhl
cmUgcmVhbGx5IGlzbid0IGEgZ29vZCB1c2UtY2FzZSB0aGF0IEkgY2FuIHNlZSBmb3IKPiBhbGxv
d2luZyBjZ3JvdXBmcyB0byBiZSBleHBvcnRlZCB2aWEgbmZzZC4gQmVzdCB0byBkaXNhbGxvdyBp
dCB1bnRpbAo+IHNvbWVvbmUgY29tZXMgdXAgd2l0aCBvbmUuCgoxMDAlIGFncmVlLgoKPiAKPiA+
IE9oIHllcyB3ZSBkaWQuIEFuZCB0aGlzIGlzIGEgbWVycnktZ28tcm91bmQuCj4gPiAKPiA+IEl0
IGlzIHZlcnkgbXVjaCBmaW5lIGZvciBhIGZpbGVzeXN0ZW1zIHRvIHN1cHBvcnQgZmlsZSBoYW5k
bGVzIHdpdGhvdXQKPiA+IHdhbnRpbmcgdG8gc3VwcG9ydCBleHBvcnRpbmcgdmlhIE5GUy4gVGhh
dCBpcyBlc3BlY2lhbGx5IHRydWUgZm9yCj4gPiBpbi1rZXJuZWwgcHNldWRvIGZpbGVzeXN0ZW1z
Lgo+ID4gCj4gPiBBcyBJJ3ZlIHNhaWQgYmVmb3JlIG11bHRpcGxlIHRpbWVzIEkgd2FudCBhIHdh
eSB0byBhbGxvdyBmaWxlc3lzdGVtcwo+ID4gc3VjaCBhcyBwaWRmcyBhbmQgbnNmcyB0byB1c2Ug
ZmlsZSBoYW5kbGVzIHdpdGhvdXQgc3VwcG9ydGluZyBleHBvcnQuCj4gPiBXaGF0ZXZlciB0aGF0
IGZzY2tpbmcgZmxhZyBpcyBjYWxsZWQgYXQgdGhpcyBwb2ludCBJIGZ1bmRhbWVudGFsbHkgZG9u
J3QKPiA+IGNhcmUuIEFuZCB3ZSBhcmUgcmVsaXZpbmcgdGhlIHNhbWUgYXJndW1lbnRzIG92ZXIg
YW5kIG92ZXIuCj4gPiAKPiA+IEkgd2lsbCBfaGFyZCBOQUtfIGFueXRoaW5nIHRoYXQgc3RhcnRz
IG1hbmRhdGluZyB0aGF0IGV4cG9ydCBvZgo+ID4gZmlsZXN5c3RlbXMgbXVzdCBiZSBhbGxvd2Vk
IHNpbXBseSBiZWNhdXNlIHRoZWlyIGZpbGUgaGFuZGxlcyBmaXQgZXhwb3J0Cj4gPiBjcml0ZXJp
YS4gSSBkbyBub3QgY2FyZSB3aGV0aGVyIHBpZGZzIG9yIG5zZnMgZmlsZSBoYW5kbGVzIGZpdCB0
aGUgYmlsbC4KPiA+IFRoZXkgd2lsbCBub3QgYmUgZXhwb3J0ZWQuCj4gCj4gSSBkb24ndCByZWFs
bHkgY2FyZSB3aGF0IHdlIGNhbGwgdGhlIGZsYWcuIEkgZG8gY2FyZSBhIGxpdHRsZSBhYm91dAo+
IHdoYXQgaXRzIHNlbWFudGljcyBhcmUsIGJ1dCB0aGUgZWZmZWN0IHNob3VsZCBiZSB0byBlbnN1
cmUgdGhhdCBmcwo+IG1haW50YWluZXJzIG1ha2UgYSBjb25zY2lvdXMgZGVjaXNpb24gYWJvdXQg
d2hldGhlciBuZnNkIGV4cG9ydCBzaG91bGQKPiBiZSBhbGxvd2VkIG9uIHRoZSBmaWxlc3lzdGVt
LsKgCgpXaHkgZG8geW91IG5lZWQgYSBjb25zY2lvdXMgZGVjaXNpb24gc28gbXVjaCB0aGF0IHlv
dSB3YW50IHRvIHRyeSB0bwpmb3JjZSBpdC4KT2YgY291cnNlIHdlIHdhbnQgY29uc2Npb3VzIGRl
Y2lzaW9ucyBhbmQgaG9wZSB0aGV5IGFyZSBhbHdheXMgbWFkZSwgYnV0CnRyeWluZyB0byBtYW5p
cHVsYXRlIHBlb3BsZSB0byBkb2luZyB0aGluZ3Mgb2Z0ZW4gZmFpbHMuICBIb3cgc3VyZSBhcmUK
eW91IHRoYXQgZnMgZGV2ZWxvcGVycyB3b24ndCBqdXN0IGNvcHktcGFzdGUgc29tZSBvdGhlciBp
bXBsZW1lbnRhdGlvbgphbmQgbm90IHRoaW5rIGFib3V0IHRoZSBpbXBsaWNhdGlvbnMgb2YgdGhl
IGZsYWc/CgpXaGF0IGlzIHRoZSBkb3duIHNpZGU/ICBXaGF0IGlzIHRoZSBoYXJtIGZyb20gYWxs
b3dpbmcgZXhwb3J0IChzaG91bGQgdGhlCmFkbWluIGF0dGVtcHQgaXQpPwpJZiB0aGVyZSB3ZXJl
IHNlcmlvdXMgc2VjdXJpdHkgY29uY2VybnMgLSB0aGVuIHN1cmUsIG1ha2UgaXQgaGFyZGVyIHRv
CmRvIHRoZSBkYW5nZXJvdXMgdGhpbmcuCkJ1dCBpZiBpdCBpcyBqdXN0ICJpdCBkb2Vzbid0IG1h
a2Ugc2Vuc2UiLCB0aGVuIHRoZXJlIGlzIG5vIGhhcm0gaW4KbGV0dGluZyBwZW9wbGUgZ2V0IGF3
YXkgd2l0aCBub3QgcmVhZGluZyB0aGUgZG9jdW1lbnRhdGlvbiwgYW5kIGZpeGluZwp0aGluZ3Mg
bGF0ZXIgYXMgY29tcGxhaW50cyBhcnJpdmUuICBUaGF0IGlzIGdlbmVyYWxseSBob3cgdGhlIHBy
b2Nlc3MKd29ya3MuCgpCdXQgaWYgeW91IHJlYWxseSByZWFsbHkgd2FudCB0byBzZXQgdGhpcyBu
ZXcgZmxhZyBvbiBhbG1vc3QgZXZlcnkKZXhwb3J0X29wZXJhdGlvbnMsIGNhbiBJIGFzayB0aGF0
IHlvdSBwbGVhc2Ugc2V0IGl0IG9uIEVWRVJZIGV4cG9ydApvcGVyYXRpb25zLCB0aGVuIGFsbG93
IG1haW50YWluZXJzIHRvIHJlbW92ZSBpdCBhcyB0aGV5IHNlZSBmaXQuCkkgdGhpbmsgdGhhdCBh
cHByb2FjaCB3b3VsZCBiZSBtdWNoIGVhc2llciB0byByZXZpZXcuCgpXaXRoIHlvdXIgY3VycmVu
dCBzZXJpZXMgaXQgaXMgbm9uLXRyaXZpYWwgdG8gZGV0ZXJtaW5lIHdoaWNoCmV4cG9ydF9vcGVy
YXRpb25zIHlvdSBoYXZlIGNob3NlbiBub3QgdG8gc2V0IHRoZSBmbGFnIG9uLiAgSWYgeW91IGhh
ZApvbmUgcGF0Y2ggdGhhdCBzZXQgaXQgZXZlcnl3aGVyZSwgdGhlbiBpbmRpdmlkdWFsIHBhdGNo
ZXMgdG8gcmVtb3ZlIGl0LAp0aGF0IHdvdWxkIGJlIGEgbG90IGVhc2llciB0byByZXZpZXcuCgpU
aGFua3MsCk5laWxCcm93bgoKCj4gCj4gQXQgdGhpcyBwb2ludCwgbWF5YmUgd2Ugc2hvdWxkIGp1
c3QgZ28gd2l0aCBOZWlsJ3MgCj4gRVhQT1JUX09QX1NVUFBPUlRTX05GU19FWFBPUlQgb3Igc29t
ZXRoaW5nLiBJdCdzIG11Y2ggbW9yZSBhcmJpdHJhcnksCj4gdGhhbiB0cnlpbmcgdG8gYmFzZSB0
aGlzIG9uIGNyaXRlcmlhIGFib3V0IGZpbGVoYW5kbGUgc3RhYmlsaXR5LCBidXQgaXQKPiB3b3Vs
ZCBnaXZlIHVzIHRoZSBlZmZlY3Qgd2Ugd2FudC4KPiAKPiAtLSAKPiBKZWZmIExheXRvbiA8amxh
eXRvbkBrZXJuZWwub3JnPgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
