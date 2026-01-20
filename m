Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG3nHVv4b2m+UQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 22:49:15 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BED104C896
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 22:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKegphsALry6vTkgm+/Om8jAeBj78cyzJxqTZjt3CDk=; b=LzSlEFhdk6cbFxEsKvkxpQ+cYt
	5C0yI1bl/wk+Q1CpzJFavMvA0OafWKVjCHfSUj4uZ0WMJ4A4uN6+9qVsaEN0zPQczhFoo5srl/tAu
	OTXnvJPXSMOHAWK2Iaoi4+au2EAOctVjloPv2BD08QFv8rLRH1/oMPUxJQw4BU7Zi/EE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viJaz-0004Gr-NJ;
	Tue, 20 Jan 2026 21:49:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1viJay-0004Gh-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 21:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DFTdVT8PJSeYiYysos7tv/Nqi0ZdC4b1x104tlt4iQg=; b=B+IKEUOBlrpbAzqC9j5F7ccPPr
 Fdf33Gy+Wh1et1bYhH39H/ov1elcR3JQlDMSFa2r/j/KP3T9GlxFR3M27mbmLdnxaFk2KPkt1hvKp
 RnD8zU8V4AxzuyQ6O+7iKZDpCEK+WQJOs9S5B3KCZbRm8nJQkX0LokFflz9DqBKb4nmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DFTdVT8PJSeYiYysos7tv/Nqi0ZdC4b1x104tlt4iQg=; b=LnFvxamuLiSDCPwj4mWa+1YzVp
 G/v/pb16Dl8+8vJlmETUNKunxRkxRLqIk6zxZ7g8cfkfXsiXnU/SkD5Iny0r81lBN4IjByt3LpHWh
 22X02YQjpsfoFYubVYUWRp0xEQpGlWupmyjARgcTwAAIOZx/RaXUlA7DbNV2qAKMy3EM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viJay-000789-S6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 21:49:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EEC4600BB;
 Tue, 20 Jan 2026 21:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD920C19421;
 Tue, 20 Jan 2026 21:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768945738;
 bh=96b8Nubirwao54BkP50ZkP0NSv+GbSST6a8dD5+v4ms=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=YSN+IBTls9vtdpn3pRtNBdf73N0qA/tQk3w4RgvlWzio2fknpGVb/a0o7P7flK/1y
 zzJtGo9wujbVTBo7Axx4HQ/eOiOPbO6DnlaRheiScvIv1C8xSZxJoQ9koobwUIo3/z
 bcm+sMkCuZPeonMVjryuEdKbJLcNDMKql+Ek0XSn5s5bTJgS271HmzsqC3P/8RVnbU
 03MMFgLCRnZ3UTWInrk2WkKm17NMBn3d1bcHjdTgKopkzmxW8tAteaboWwKj5BrV20
 Y92l4G1JtVIu1HmY5gXGwvqSrpdFYgSn3e/bU6+kNyrad4sDexNfki+wGKWiarbNRN
 562IzeWDAwUbg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id C6BC1F40068;
 Tue, 20 Jan 2026 16:48:56 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Tue, 20 Jan 2026 16:48:56 -0500
X-ME-Sender: <xms:SPhvaQtWESY-A74K_HEn66lmVvpKNm5MFxR6oEthFHsJh9f_m8HVhg>
 <xme:SPhvaYRYYoD8hzZ-gIklJVxdAnFdEQdnVq654EzYKHMt8mKFQ1HUDx-gqtBhm_VwW
 y-Z6EZs6GGoSKSpdopfG6bYC-99jxEd1TpQw3BiJGcJttr32OeEtWRt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeduheefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
 khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
 hnpefhffekffeftdfgheeiveekudeuhfdvjedvfedvueduvdegleekgeetgfduhfefleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
 hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
 leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
 hilhdrtghomhdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehsvghnohiihhgrthhskhihsegthhhrohhmihhumhdrohhrghdprhgtphhtth
 hopegrughilhhgvghrrdhkvghrnhgvlhesughilhhgvghrrdgtrgdprhgtphhtthhopehs
 lhgrvhgrseguuhgsvgihkhhordgtohhmpdhrtghpthhtoheprhhonhhnihgvshgrhhhlsg
 gvrhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnnhgrsehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
 gtvghmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhgroheskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtohepughjfihonhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SPhvaamXZA19JIcSMetmmNDyPupKYtpsGBX8RUilZqnOb0aJRtehUQ>
 <xmx:SPhvaeTpcVU1Wim3vGB6ES93L_VTC352WS9ZxeyR0pY82SdQj2k7jQ>
 <xmx:SPhvaf64sRrImZuiE0FT-3g9SeUWs7whMFXlvnbGOZ0KmNQDNm2Ajg>
 <xmx:SPhvaVEUXZXhb9_ub-oDB-zXsCXaXQzldUQIcPSpt844LE_RlPLPmA>
 <xmx:SPhvaZHRcYWU9BKUQSIRIo2WYqA9j8HDF7yWiIXBvkQ32EK5DSe3aB5a>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 89A9B780070; Tue, 20 Jan 2026 16:48:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AfQWKZtCjdVF
Date: Tue, 20 Jan 2026 16:48:31 -0500
To: "Darrick J. Wong" <djwong@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>
Message-Id: <38bf1452-8cf8-477b-bcc3-9fe442033bc5@app.fastmail.com>
In-Reply-To: <20260120172608.GQ15551@frogsfrogsfrogs>
References: <20260120142439.1821554-1-cel@kernel.org>
 <20260120142439.1821554-2-cel@kernel.org>
 <20260120172608.GQ15551@frogsfrogsfrogs>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 20, 2026, at 12:26 PM, Darrick J. Wong wrote:
 > On Tue, Jan 20, 2026 at 09:24:24AM -0500, Chuck Lever wrote: >> From: Chuck
 Lever <chuck.lever@oracle.com> >> >> Enable upper layers such as [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viJay-000789-S6
Subject: Re: [f2fs-dev] [PATCH v6 01/16] fs: Add case sensitivity flags to
 file_kattr
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
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, Steve French <sfrench@samba.org>,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 frank.li@vivo.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, glaubitz@physik.fu-berlin.de,
 Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-nfs@vger.kernel.org, Theodore Tso <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 Hans de Goede <hansg@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.10 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[31];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[suse.cz,manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BED104C896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Tue, Jan 20, 2026, at 12:26 PM, Darrick J. Wong wrote:
> On Tue, Jan 20, 2026 at 09:24:24AM -0500, Chuck Lever wrote:
>> From: Chuck Lever <chuck.lever@oracle.com>
>> 
>> Enable upper layers such as NFSD to retrieve case sensitivity
>> information from file systems by adding FS_XFLAG_CASEFOLD and
>> FS_XFLAG_CASENONPRESERVING flags.
>> 
>> Filesystems report case-insensitive or case-nonpreserving behavior
>> by setting these flags directly in fa->fsx_xflags. The default
>> (flags unset) indicates POSIX semantics: case-sensitive and
>> case-preserving. These flags are read-only; userspace cannot set
>> them via ioctl.
>> 
>> Relocate struct file_kattr initialization from fileattr_fill_xflags()
>> and fileattr_fill_flags() to vfs_fileattr_get() and the ioctl/syscall
>> call sites. This allows filesystem ->fileattr_get() callbacks to set
>> flags directly in fa->fsx_xflags before invoking the fill functions,
>> which previously would have zeroed those values. Callers that bypass
>> vfs_fileattr_get() must now zero-initialize the struct themselves.
>> 
>> Case sensitivity information is exported to userspace via the
>> fa_xflags field in the FS_IOC_FSGETXATTR ioctl and file_getattr()
>> system call.
>> 
>> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
>> ---
>>  fs/file_attr.c           | 14 ++++++--------
>>  fs/xfs/xfs_ioctl.c       |  2 +-
>>  include/linux/fileattr.h |  3 ++-
>>  include/uapi/linux/fs.h  |  2 ++
>
> This ought to go to linux-api because you're changing the userspace api.
> Granted it's only adding a flag definition to an existing ioctl, but
> FS_XFLAG_CASEFOLD /does/ collide with Andrey's fsverity xflag patch...
>
> (The rest of the changes looks ok to me.)

Process question for Christian: Do you want to see a v7 of this
series with Cc: linux-api before proceeding, or are you taking
both Andrey's and mine and can resolve the conflict, or ... ?


> --D
>
>>  4 files changed, 11 insertions(+), 10 deletions(-)
>> 
>> diff --git a/fs/file_attr.c b/fs/file_attr.c
>> index 13cdb31a3e94..2700200c5b9c 100644
>> --- a/fs/file_attr.c
>> +++ b/fs/file_attr.c
>> @@ -15,12 +15,10 @@
>>   * @fa:		fileattr pointer
>>   * @xflags:	FS_XFLAG_* flags
>>   *
>> - * Set ->fsx_xflags, ->fsx_valid and ->flags (translated xflags).  All
>> - * other fields are zeroed.
>> + * Set ->fsx_xflags, ->fsx_valid and ->flags (translated xflags).
>>   */
>>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags)
>>  {
>> -	memset(fa, 0, sizeof(*fa));
>>  	fa->fsx_valid = true;
>>  	fa->fsx_xflags = xflags;
>>  	if (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)
>> @@ -46,11 +44,9 @@ EXPORT_SYMBOL(fileattr_fill_xflags);
>>   * @flags:	FS_*_FL flags
>>   *
>>   * Set ->flags, ->flags_valid and ->fsx_xflags (translated flags).
>> - * All other fields are zeroed.
>>   */
>>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
>>  {
>> -	memset(fa, 0, sizeof(*fa));
>>  	fa->flags_valid = true;
>>  	fa->flags = flags;
>>  	if (fa->flags & FS_SYNC_FL)
>> @@ -84,6 +80,8 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
>>  	struct inode *inode = d_inode(dentry);
>>  	int error;
>>  
>> +	memset(fa, 0, sizeof(*fa));
>> +
>>  	if (!inode->i_op->fileattr_get)
>>  		return -ENOIOCTLCMD;
>>  
>> @@ -323,7 +321,7 @@ int ioctl_setflags(struct file *file, unsigned int __user *argp)
>>  {
>>  	struct mnt_idmap *idmap = file_mnt_idmap(file);
>>  	struct dentry *dentry = file->f_path.dentry;
>> -	struct file_kattr fa;
>> +	struct file_kattr fa = {};
>>  	unsigned int flags;
>>  	int err;
>>  
>> @@ -355,7 +353,7 @@ int ioctl_fssetxattr(struct file *file, void __user *argp)
>>  {
>>  	struct mnt_idmap *idmap = file_mnt_idmap(file);
>>  	struct dentry *dentry = file->f_path.dentry;
>> -	struct file_kattr fa;
>> +	struct file_kattr fa = {};
>>  	int err;
>>  
>>  	err = copy_fsxattr_from_user(&fa, argp);
>> @@ -434,7 +432,7 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
>>  	struct filename *name __free(putname) = NULL;
>>  	unsigned int lookup_flags = 0;
>>  	struct file_attr fattr;
>> -	struct file_kattr fa;
>> +	struct file_kattr fa = {};
>>  	int error;
>>  
>>  	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
>> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
>> index 59eaad774371..f0417c4d1fca 100644
>> --- a/fs/xfs/xfs_ioctl.c
>> +++ b/fs/xfs/xfs_ioctl.c
>> @@ -496,7 +496,7 @@ xfs_ioc_fsgetxattra(
>>  	xfs_inode_t		*ip,
>>  	void			__user *arg)
>>  {
>> -	struct file_kattr	fa;
>> +	struct file_kattr	fa = {};
>>  
>>  	xfs_ilock(ip, XFS_ILOCK_SHARED);
>>  	xfs_fill_fsxattr(ip, XFS_ATTR_FORK, &fa);
>> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
>> index f89dcfad3f8f..709de829659f 100644
>> --- a/include/linux/fileattr.h
>> +++ b/include/linux/fileattr.h
>> @@ -16,7 +16,8 @@
>>  
>>  /* Read-only inode flags */
>>  #define FS_XFLAG_RDONLY_MASK \
>> -	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR)
>> +	(FS_XFLAG_PREALLOC | FS_XFLAG_HASATTR | \
>> +	 FS_XFLAG_CASEFOLD | FS_XFLAG_CASENONPRESERVING)
>>  
>>  /* Flags to indicate valid value of fsx_ fields */
>>  #define FS_XFLAG_VALUES_MASK \
>> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
>> index 66ca526cf786..919148beaa8c 100644
>> --- a/include/uapi/linux/fs.h
>> +++ b/include/uapi/linux/fs.h
>> @@ -253,6 +253,8 @@ struct file_attr {
>>  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
>>  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
>>  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
>> +#define FS_XFLAG_CASEFOLD	0x00020000	/* case-insensitive lookups */
>> +#define FS_XFLAG_CASENONPRESERVING 0x00040000	/* case not preserved */
>>  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
>>  
>>  /* the read-only stuff doesn't really belong here, but any other place is
>> -- 
>> 2.52.0
>> 
>>

-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
