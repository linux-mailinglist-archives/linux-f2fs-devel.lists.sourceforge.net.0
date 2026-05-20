Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD1QEGDoDWrM4gUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 18:59:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DB592BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 18:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OH1y0WDSHxDYT3Hfr5rZZoPnstwJ2QdBHAph97Z5hAs=; b=c972zvv22PjEMF7UJxmXc2ZDRK
	yJkmuQZp1h+uP08zUnYWxgFAmpW4e/rrFZsaU5IsFo4ue9Kzqk017VBDW2mwhCipHfwx5UJ/qjZ8M
	k2NW/aMmOzxe8s1ej8Ci5vSvzkrLpt8gzshizXnplaV11J3McPkh1S2740+sNHV+ostQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPkFy-0008Q3-Rp;
	Wed, 20 May 2026 16:58:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wPkFx-0008Px-FD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 16:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3HYCTjUKnMgOBwx9QLeP6Mvnf90VdQqX6Kq1eV2MzLM=; b=O7652ypcU+qCDGJMEX8CP4S1TV
 5R7ItuZ6HPrDRkl+/W/Q7Yhjm25f8/DsxjyDNAxcDulfGeYhtQmoybfMqA2PL0S1K7JKoaU6Iq817
 b06rPvBG79DkJD0n+l2myscbL3OLOxgj39txCc1EOSnsIJTd4ot+9e+zHb0fo8R6OeKA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3HYCTjUKnMgOBwx9QLeP6Mvnf90VdQqX6Kq1eV2MzLM=; b=f8xVJRi7k1hv12GiVhyOKkzKbc
 hGzRgrdyfkLKvms9b8OY+n6KSk1fr142aVMG1XbBvoibWh8+bwcJzyRsmAgHj32zXlYfy78NIfj6q
 BNP+lxAS5hqNttVWXSsmo2XP40hxinlDw4v6l3GjM8QNc9+NLoFLxciHtYu7shIBLzMA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPkFt-00029U-RB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 16:58:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9EBA560139;
 Wed, 20 May 2026 16:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0611F00893;
 Wed, 20 May 2026 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779296324;
 bh=3HYCTjUKnMgOBwx9QLeP6Mvnf90VdQqX6Kq1eV2MzLM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject;
 b=UwbdSUFfiPD5nEs75u3836d9xkPyk26dXYEF4j6ngljmJB9byL9nvxBvogPMZEwS4
 HlmwR0Rq34lWaUCSaxX+qP0G3jQY+n5dNstgtVC1XjtFLnN6eag316xOeo21Oo3l8g
 nI/CHm5zH75HQblS72L7CFw3OiTnVKVi2i56AqGT074yhwFoulv9ggS7h9og71NL8s
 CUImdcg29FH5HSElh25NizNdrsqsSlyqKLhIH/aZ9mRzSL8VNxnMhU9kQHBMXoWC96
 wXpf0wB09Xs4FpEjOOUxXPlqI+hwRYphh5mtId442ujsKT5lIzZRLejcS2h5i3exxx
 +yDZS5cE5w3vg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 653BFF4007D;
 Wed, 20 May 2026 12:58:42 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Wed, 20 May 2026 12:58:42 -0400
X-ME-Sender: <xms:QugNavyinx7bKrqL4HPeQunpcXbIaluZN7wF9StWTZXgR2qve6JZ-g>
 <xme:QugNaiGhRRos_yOLWfm-5tiI1PIm-uXq5yDDMT3oiNGBSfN1wx_UeyhKOJHGIa_bo
 cQ9rqE22bExtjIDyUHyrxhoLANTG9qDp37GvGe2tAPk0XVFu3TxC64>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeehudejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:QugNamfaq2UpdXiWnPnay5nQ_rQckvm_41kR8NgaI4_lDDqQ4Yiy8A>
 <xmx:QugNamv95ErjE6pb8okHjc44uM5BHK6ky05NPxz2-vrTiBeWgMpiJw>
 <xmx:QugNaqupzmbSbdKQTrJcjN0dK0NknGvcRa4HhfzOtsthEH7eWtONFQ>
 <xmx:QugNat90cmRSntFhphxoUhXn78eiEA_yq5VNO1np6BiZmUQI6kUYVw>
 <xmx:QugNar9VQVV9Crz_mdTjuEL665Y3HC3jfH6afIH-rv2ZfQMjW6d6XLfr>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 33FD9780076; Wed, 20 May 2026 12:58:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AuvJ25pICu_N
Date: Wed, 20 May 2026 12:58:22 -0400
To: "Mark Brown" <broonie@kernel.org>
Message-Id: <858d7233-1d9c-48f4-aa4f-c5a9f6e1f5dc@app.fastmail.com>
In-Reply-To: <3a347b64-f91b-450f-b27d-26ea6810b960@sirena.org.uk>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
 <20260507-case-sensitivity-v14-3-e62cc8200435@oracle.com>
 <dc69224d-9926-4414-8c6e-4c15ae98705b@sirena.org.uk>
 <04302551-3628-4036-9a3f-596cb782f5b7@app.fastmail.com>
 <a366645c-364d-4588-8a15-4cd446f64366@sirena.org.uk>
 <8b750b3f-4d73-41f3-84fb-6e387fd24168@app.fastmail.com>
 <3a347b64-f91b-450f-b27d-26ea6810b960@sirena.org.uk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 20, 2026, at 11:19 AM, Mark Brown wrote: > On
 Wed, May 20, 2026 at 11:12:51AM -0400, Chuck Lever wrote: >> On Wed, May
 20, 2026, at 10:54 AM, Mark Brown wrote: > >> > It's not testing tmp [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
X-Headers-End: 1wPkFt-00029U-RB
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7F6DB592BFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, May 20, 2026, at 11:19 AM, Mark Brown wrote:
> On Wed, May 20, 2026 at 11:12:51AM -0400, Chuck Lever wrote:
>> On Wed, May 20, 2026, at 10:54 AM, Mark Brown wrote:
>
>> > It's not testing tmpfs (well, it does but that passed), as the log above
>> > shows it is making a vfat filesystem on a loop device backed by a file
>> > that happens to be in a tmpfs and then testing that.  There's a bunch of
>> > filesystems covered in this manner:
>
>> OK. Is vfat the only failure in LTP statx04 ?
>
> Yes, it's the only one showing as failing - there are four failures
> correspoding to the four tests done for vfat.

03/15 adds .fileattr_get = fat_fileattr_get for both
fat_file_inode_operations and vfat_dir_inode_operations. LTP
opens a directory (SAFE_OPEN(TESTDIR, O_RDONLY|O_DIRECTORY)),
so FS_IOC_GETFLAGS on the dir now succeeds, and statx04
proceeds where it was previously skipped.

AFAICS, 03/15 did not change pre-existing kernel behavior of
stx_attributes_mask on vfat. It merely converted a "skipped"
LTP outcome into an "executed but failed" outcome.

Fix options:

* fat_getattr() could call generic_fill_statx_attr(inode, stat),
  which advertises KSTAT_ATTR_VFS_FLAGS (IMMUTABLE + APPEND).
  That clears 2 of 4 TFAILs but not COMPRESSED/NODUMP, which
  FAT genuinely does not back.

* Set stat->attributes_mask |= KSTAT_ATTR_FS_IOC_FLAGS in
  fat_getattr(). Honest only to the extent that FAT now exposes
  some FS_*_FL bits via fileattr. This would silence the test
  failures, but advertises capabilities (COMPRESSED, NODUMP)
  FAT doesn't track.

* Admit the LTP statx04 test needs to be updated.
  FS_IOC_GETFLAGS succeeding does not logically imply all four
  FS_IOC_FLAGS-mapped STATX_ATTR_* bits are supported. The
  test's gate is too coarse for filesystems that gained a
  narrowly-scoped fileattr_get (just casefold/immutable). The
  test's tag list pins it to filesystems that do support the
  full set, but vfat was tacitly excluded by the prior ENOTTY.

The first option is the narrowest kernel-side change, and
matches what other minimal-fileattr filesystems do.


-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
