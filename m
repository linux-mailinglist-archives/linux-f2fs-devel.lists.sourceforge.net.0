Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C4BD3C36E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 10:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:Message-id:Date:References:In-reply-to:To:From:MIME-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTOISJ3UkCXv6q4BlDcFYlr6uepoXVdEeHG829UB+ig=; b=DrfFKV+09uEeb8SW8CIUNwxxs8
	WaVaiX53QsLJYrAROPAbFp/Hkv2MKCxlU68bOSHygd9wOI37nsjJH+/KLn4O+VXwOrMg+7rijfAnX
	boK2U83fhonC2aCsH9eioREkh2w91cqZZJX1MgOVIQ2QIvrAd6fDSenrXwfR6CJthDw4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi82A-0005o5-Td;
	Tue, 20 Jan 2026 09:28:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <neilb@ownmail.net>) id 1vi828-0005nb-OS;
 Tue, 20 Jan 2026 09:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Message-id:Date:References:In-reply-to:
 Subject:Cc:To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7QgCrbLkIptlQB8MVpfuQ5CmfZ1YH3bd02HxJZ3+58E=; b=hGv4ZySRihuNAnEB3s9xxOlH3l
 jiGc3C2IK2QpTZATSIFjMvybwj9J+zNjK6tQMGShfPmIGR7PbieRt/oyNzoy0t7TLReKR5Ugg1gaH
 5Sxkc7GXgTyaT/yxCjw6ayzksihVX7eDgcJ8A8ESGetBGxhwn31fif/48h2C5jkYjAig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Reply-To:Message-id:Date:References:In-reply-to:Subject:Cc:To:From:
 MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7QgCrbLkIptlQB8MVpfuQ5CmfZ1YH3bd02HxJZ3+58E=; b=gqSL42JKqiBIcTI72mr6CSuPkF
 /rwtK70kdHIQbwg3M64uAl0bQp4+5meZyhxKK277NF/r1c6zxQMMVrmaZ9a8x7ABfDAwZ/hBg6QIV
 z5JASwslt4lD21nUtT1z/jdl+gy/En2HXZBHqUKR9RQBWsMcXo06f7UIqEhBbXdxLCcA=;
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi828-0007ij-Ig; Tue, 20 Jan 2026 09:28:21 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailflow.stl.internal (Postfix) with ESMTP id CE9921300F39;
 Tue, 20 Jan 2026 04:28:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Tue, 20 Jan 2026 04:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
 1768901292; x=1768908492; bh=7QgCrbLkIptlQB8MVpfuQ5CmfZ1YH3bd02H
 xJZ3+58E=; b=j33OTuP0cjno3z5TCSPfTCf69nIJq4J2TB5KtE0o/LhmJQgOMMH
 kw9U4yfo+H4rbb4XXms15vEyKh5x5b9B49ixFXgMxO4Fm/hlFNGiQ+bGN45gDtRw
 OmBoeYoqajuPHnyR9SoIEo6hAUWx0AGYwxm0DKRLHzi1XCnz83A+Hu2GZPA6aOKy
 RYLYKmY0UNhDwR1vtSOzYxhEesYwmuTg/Wi6L8FGSkj9+ZIBdbcCFjmPCZksIcHe
 kKd1xQhaGqcg0mozQ4CX54TPCVBCAS2wCwpvglGH91fDXLL6Bvjn2GFbB+NC5Mzg
 8aJ9uAz6SFiYHNlOnXGI9e3y5wQd6hGFAJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768901292; x=
 1768908492; bh=7QgCrbLkIptlQB8MVpfuQ5CmfZ1YH3bd02HxJZ3+58E=; b=v
 RfEPB9lwITUP46pQlb43ZbdMvxQAVBGMGvib8VTBG9JSo9K4qJAJLjbu5y7j73ym
 Qq3Bc0GK6JEw8nge/9U3NMkxvbjnEI/Ql3zoReMMAU2ycFjN5VLIXyTGDlZ9tldG
 YgURkKvG64q2sB1nBTb/8GE6Lw99gQK+2TICCynSDho7Mvxl3hSSag9eGoZb+MaV
 oo8v63rBhvVlkO8Ct3o6GUqwRPu+Ijq5yt0cKqsqAdpEZGpx+AkEVlFEQ3yPkt8x
 uJ/IqXAfO3Pl34Ql8sGavblmOZ2r9+wh8PIDOYvjhIPgR5sCl1S563/bzjtKHtCZ
 P4olLR+6UbfSBxEoSdPgg==
X-ME-Sender: <xms:qEpvaZRu_TffLaKZaE2CMY56BJZs69KBOLtnttktrwuGzZ9ody-WNQ>
 <xme:qEpvaQKNRSt0Wi7GeDYGOldsinZiQ_yhrx7t0k8T2G3tKf8FjH9OLeJ94c9A7G_ww
 X6RDyQAeSOcxaWQTYme-4_uSzp1k5iDvZmDz68VmQKXregkq1o>
X-ME-Received: <xmr:qEpvaUCQIq-1KHB6_RIe1LGDrNvPT7-Pf2pS69NApMKw_XyWcd3Xjgm1K74OT05ZV5sAHW67jfmb2iTtKkO835nraIAcdJpfENZOC6QYa41Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedttdehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtjeertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epudetfefhudevhedvfeeufedvffekveekgfdtfefggfekheejgefhteeihffggfelnecu
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
X-ME-Proxy: <xmx:qEpvaeYFJm2gr5_L8NWl6mKqz3iuWcYL5GhOz7qN1Jbytm-BYS6-XA>
 <xmx:qEpvaWaRmlMl_FAkLOWmvpEFBndgYt5ijvyvEjxWGEaN27mPHvAi-g>
 <xmx:qEpvaQ3aTzLxTMX0gQJAiP7LkrKQZuiwBkg6xW_bdcSF80TWtR8qMw>
 <xmx:qEpvaefZ5gApKS4TFvhYKouLIp05WV67rLedqicozK4OIkyQ2Rx9Zg>
 <xmx:rEpvaZbrohR6KsMgi07NQMg42JbqLkXHlbfm5plWcXavjDNCqQ_UV7PJ>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 04:27:50 -0500 (EST)
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Christoph Hellwig" <hch@infradead.org>
In-reply-to: <aW8w2SRyFnmA2uqk@infradead.org>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>,
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>,
 <9c99197dde2eafa55a1b55dce2f0d4d02c77340a.camel@kernel.org>,
 <176877859306.16766.15009835437490907207@noble.neil.brown.name>,
 <aW3SAKIr_QsnEE5Q@infradead.org>,
 <176880736225.16766.4203157325432990313@noble.neil.brown.name>,
 <20260119-kanufahren-meerjungfrau-775048806544@brauner>,
 <176885553525.16766.291581709413217562@noble.neil.brown.name>,
 <aW8w2SRyFnmA2uqk@infradead.org>
Date: Tue, 20 Jan 2026 20:27:46 +1100
Message-id: <176890126683.16766.5241619788613840985@noble.neil.brown.name>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 20 Jan 2026, Christoph Hellwig wrote: > On Tue, Jan
 20, 2026 at 07:45:35AM +1100, NeilBrown wrote: > > This sounds like you are
 recommending that we give in to bullying. > > I find your sugges [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [neilb(at)ownmail.net]
X-Headers-End: 1vi828-0007ij-Ig
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 20 Jan 2026, Christoph Hellwig wrote:
> On Tue, Jan 20, 2026 at 07:45:35AM +1100, NeilBrown wrote:
> > This sounds like you are recommending that we give in to bullying.
> 
> I find your suggestion that anything you disagree with is bullying
> extremely offensive.  If you have valid reasons for naming something
> after the user instead of explaining the semantics, please explain that.

I was referring not to your behaviour but to this statement by Christian:

  So if Christoph insists on the other name then I say let's just go with it.

I think that someone "insisting" on something rather than "arguing
rationally" for something "sounds like" bullying.  Had Christian said
something like "Christoph has convinced me of the wisdom of his choice"
that would have been very different.

I am quite happy to have reasoned discussions with people who disagree
with me.  I hope to always provide new relevant information, and hope
they will too.

> 
> If you think NFS actually explains the semantics pretty well, please
> explain that too, especially in forms that can be put into
> documentation, including for the user ABI.

There are multiple issues here:

 - filehandle stability.  As far as I know all filesystems provide
   stable filehandles when the "subtree_check" export option is not used.
   Certainly cgroupfs does.  So having an EXPORT_OP_STABLE_HANDLES
   flag would mean it was set for every filesystem - unless there is
   something else I'm not aware of.  That is certainly possible and I
   hope someone will let me know if I'm missing something.

 - filehandle uniqueness.  This is somewhat important and if a
   filesystem doesn't provide it, that should be considered a bug.  In a
   different thread Christian has observed that there would be benefit
   if pidfs and nsfs provided uniqueness across reboots.  It is quite
   easy for a virtual filesystem to generate a 64 bit random number when
   the fs is initialised, and include that in file handles.  Having a
   EXPORT_OP_REUSES_HANDLES flag could mark filesystems that are still
   buggy if that is thought to be useful.

 - GETATTR always reporting file size of 0.  This is the only concrete
   symptom that Jeff has reported (that I have seen).  This  makes it
   impossible to read files over NFS even if they have content.
   Would EXPORT_OP_INACCURATE_SIZE be useful?

 - maintainer feature choice.  A maintainer may choose not to support
   export over NFS because they feel that there is no value and the
   possible support burden would not be worth it.  There may be locking
   / lease / etc issues that further complicate things.  So it might be
   reasonable for a maintainer to choose to forbid NFS export while
   allowing local fhandle access. EXPORT_OP_NO_NFS_EXPORT.

It took me a while to sift through the code/patches/comments and come to
this understanding and I apologise if I wasn't as clear earlier.  But
my intuition was always that file handle stability was never the real
issue, and maintainer choice was.  Hence my rejection of the
"STABLE_HANDLES" name.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
