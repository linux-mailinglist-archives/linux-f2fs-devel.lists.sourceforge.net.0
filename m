Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC0JKKfPDWr53QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 17:13:43 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BA1590963
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 17:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHlSZRcbUrctGrmUtHl6iH4k2bC0Ee4xxx4QVQz2H+0=; b=a8eFTTDi8IIR9C3elX8SsJnUAJ
	mIiW46YbK3NG/6qi/4D/fj6ShKmt5bnjeUsGtGeWmKd+UwuHnRkqZdL9fs6CR42C4S8tBkq1Oxa6h
	PZt1dFALMaInQP2+2ghsWDDFnC19eKH//bWq6PrMA4RkouI29VCBTXJEQsQSAC/0lbtg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPibs-0000uo-Br;
	Wed, 20 May 2026 15:13:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wPibr-0000ui-Hh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 15:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8dqhKrp9QxPmbHdOhtinaRS5mItxrPIhA1DLRkJPMuw=; b=Qx4g/MK5lmK2vhLcA21iokGy29
 +pdFx6QI0N6F2n34ibbcu9DPRk+4HqArJ08kcGmMpciBBDrbW5IsZhC4LOv4ZYrrrvZ4Zi6hJKw30
 wnX8QE40fI8d2tmQ+/BXWYnTNmxLEBRXRfz7+TVtPgcu8wyqc2EdtunAfDfdyDLnv38Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8dqhKrp9QxPmbHdOhtinaRS5mItxrPIhA1DLRkJPMuw=; b=JXro8cAOd9I4frNEbXO5dE+HPi
 APKfuJELDTFRXBH+3j1loM5aH6K01/vd+G1uToBbxAMeKEdpZeEpmuaf0X/Pso2CboHRYQs4jSRp9
 6AryzQFAEGUjzYRqYgQGHNwbN3W02vlfY6oudjRtrxPM+80xCt0PgEF19Pgnow2zEUeA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPibn-0003Sl-2o for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 15:13:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CC47960126;
 Wed, 20 May 2026 15:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867931F000E9;
 Wed, 20 May 2026 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779289993;
 bh=8dqhKrp9QxPmbHdOhtinaRS5mItxrPIhA1DLRkJPMuw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject;
 b=bDcrDxgLBXqFd7oQ0wZU622SnF/gVCHQtBI0GrLMzkntsFVzv52Agrt4HYg93JO7A
 ZRtgunV6IZDaK3zNaRtWQAfTHpld/8PkX2dKFnPtNP0fto38nrZzC3OBRp2yoyX4lt
 pdxubsyu3DFOIEl6f6uUAYV+5pMxBJXxw1b9PCHnBREQtbZQjDysNanhWnNIT3v0W6
 LBY0asiOPMnAaC3I5Bm5u2q7q1ZaBbA3QHBUiQGm47FzbfQrzdd8khWWPigXOoPxdW
 kwNjXUqUVfGG+L0Wz+G9dz3/LSru4bFBxQBQjPEEdB4cTbPpoo5ZkXNPDVQAn3YdSH
 LDkDpyrlXc0jQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id B4FCDF4007F;
 Wed, 20 May 2026 11:13:11 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Wed, 20 May 2026 11:13:11 -0400
X-ME-Sender: <xms:h88NanPZoAh6fJjERdRUPNJd7ginhDUpVvORLEtlIC_A8ozAhyCpFQ>
 <xme:h88Nasy7bDtAU5vDFUlrjierZTX9I8ObWJN3rLJrTM7gqlgzW5xwL2g0JP9qabEKX
 t7dDK5dS8m65gV5RY5e9uQhs3cCsXLyvhlu7YbrM_qObXjl8lEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeegleeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
 khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
 hnpefhffekffeftdfgheeiveekudeuhfdvjedvfedvueduvdegleekgeetgfduhfefleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
 hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
 leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
 hilhdrtghomhdpnhgspghrtghpthhtohepfeegpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehsvghnohiihhgrthhskhihsegthhhrohhmihhumhdrohhrghdprhgtphhtth
 hopegrughilhhgvghrrdhkvghrnhgvlhesughilhhgvghrrdgtrgdprhgtphhtthhopehs
 lhgrvhgrseguuhgsvgihkhhordgtohhmpdhrtghpthhtoheprhhonhhnihgvshgrhhhlsg
 gvrhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnnhgrsehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
 gsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtvghmsehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopegthhgroheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:h88NakEks2rfD9OalS8ngqxS5q8fCYyxdhjAoTCi9Vc61b5QWwMZQA>
 <xmx:h88NajoeLr4Pi6ussVLVJN2t71CEoSYKC8sec503wHX9CcpLAx8DVQ>
 <xmx:h88NakJwz4NpVTdqRErBae-kslldix6kZFVhiV6VR5i8YzddCZZ-cA>
 <xmx:h88Naja5ApYgknkBh5zV-M4CtPMIi2SvPkUorF9SPDyxLjrWu5ne_A>
 <xmx:h88Nag71tyG97Kc5muYomSB72JP-pdJnkr01SeEceG5QQqDJlzWdPW56>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 83D25780070; Wed, 20 May 2026 11:13:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AuvJ25pICu_N
Date: Wed, 20 May 2026 11:12:51 -0400
To: "Mark Brown" <broonie@kernel.org>
Message-Id: <8b750b3f-4d73-41f3-84fb-6e387fd24168@app.fastmail.com>
In-Reply-To: <a366645c-364d-4588-8a15-4cd446f64366@sirena.org.uk>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
 <20260507-case-sensitivity-v14-3-e62cc8200435@oracle.com>
 <dc69224d-9926-4414-8c6e-4c15ae98705b@sirena.org.uk>
 <04302551-3628-4036-9a3f-596cb782f5b7@app.fastmail.com>
 <a366645c-364d-4588-8a15-4cd446f64366@sirena.org.uk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 20, 2026, at 10:54 AM, Mark Brown wrote: > On
 Wed, May 20, 2026 at 10:39:16AM -0400, Chuck Lever wrote: >> On Wed, May
 20, 2026, at 10:31 AM, Mark Brown wrote: >> > On Thu, May 07, 2026 at [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wPibn-0003Sl-2o
Subject: Re: [f2fs-dev] [PATCH v14 03/15] fat: Implement fileattr_get for
 case sensitivity
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, Steve French <sfrench@samba.org>,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 frank.li@vivo.com, linux-nfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, Hans de Goede <hansg@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.10 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D9BA1590963
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Wed, May 20, 2026, at 10:54 AM, Mark Brown wrote:
> On Wed, May 20, 2026 at 10:39:16AM -0400, Chuck Lever wrote:
>> On Wed, May 20, 2026, at 10:31 AM, Mark Brown wrote:
>> > On Thu, May 07, 2026 at 04:52:56AM -0400, Chuck Lever wrote:
>
>> > I'm seeing a regression in -next with the LTP statx04 test which bisects
>> > to this commit:
>
>> > tst_tmpdir.c:316: TINFO: Using /tmp/LTP_sta8hUyB4 as tmpdir (tmpfs 
>> > filesystem)
>> > tst_device.c:98: TINFO: Found free device 0 '/dev/loop0'
>> > tst_test.c:2047: TINFO: LTP version: 20260130
>> > tst_test.c:2050: TINFO: Tested kernel: 7.1.0-rc4-next-20260520 #1 SMP 
>> > PREEMPT @1779279361 aarch64
>
>> > ...
>
>> > tst_test.c:1985: TINFO: === Testing on vfat ===
>> > tst_test.c:1290: TINFO: Formatting /dev/loop0 with vfat opts='' extra 
>> > opts=''
>> > tst_test.c:1302: TINFO: Mounting /dev/loop0 to 
>> > /tmp/LTP_sta8hUyB4/mntpoint fstyp=vfat flags=0
>> > statx04.c:121: TFAIL: STATX_ATTR_COMPRESSED not supported
>> > statx04.c:121: TFAIL: STATX_ATTR_APPEND not supported
>> > statx04.c:121: TFAIL: STATX_ATTR_IMMUTABLE not supported
>> > statx04.c:121: TFAIL: STATX_ATTR_NODUMP not supported
>
>> At first blush, that does not seem like a plausible bisect
>> result. This commit shouldn't affect the behavior of tmpfs
>> in any way.
>
> It's not testing tmpfs (well, it does but that passed), as the log above
> shows it is making a vfat filesystem on a loop device backed by a file
> that happens to be in a tmpfs and then testing that.  There's a bunch of
> filesystems covered in this manner:
>
> tst_test.c:1985: TINFO: === Testing on ext2 ===
> tst_test.c:1985: TINFO: === Testing on ext3 ===
> tst_test.c:1985: TINFO: === Testing on ext4 ===
> tst_test.c:1985: TINFO: === Testing on btrfs ===
> tst_test.c:1985: TINFO: === Testing on vfat ===
> tst_test.c:1985: TINFO: === Testing on tmpfs ===

OK. Is vfat the only failure in LTP statx04 ?

-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
