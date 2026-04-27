Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAxFBBtl72kIBAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 15:31:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D2847370B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 15:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kohJmyTAzXOJ3/S7gpUpJpce6zOQ5nhTNpheHAopm0c=; b=jeIuhtcV8v8qUHr876JnHiCm3e
	P3PTPt7+47th2otKD6yawm59wX0CkBPXp01rzScGwjimv54RtSoJA0FAFt31gxp7VNYx4A/1nu9jo
	3xzQgK166nlm3CsX8+kkZUt39Fsq38PTmoROu/wRoDSSnZFDhY1zkrrx+CYg+qzE9xJA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHM3E-0001WE-On;
	Mon, 27 Apr 2026 13:31:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wHM3C-0001W5-Id
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 13:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WJ0niEXXInFlgFeEFFk70tlykXKG1NdNkzn0NwaooQ0=; b=eqpUEdpxZ8Uc9dg/DaWxNlMJmu
 UN0neOVpVUzp0tsaZhBP/VYJjUCBx+wWlMBYokbP7fVzW9EJCKTXjdGNLGthrdUrorfdaTWiKxyzG
 5+hqmbf+qCsaD1JxcztB/sptM+wFA8kTMpWYtRyRTRv+GGmHu8I3BqahQI1b7CADtH+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WJ0niEXXInFlgFeEFFk70tlykXKG1NdNkzn0NwaooQ0=; b=lFK7o2okkarylqV0qiodfHEGPT
 wpdyOo9K/qw4LMBph6a65MIFKhpSpzTfvkk2UrZgc4DDXvU7ecOTGTJexP9WV7NWwby1sW3r7Jo5/
 6b6k/HcjjtMJ398mH0EqajZxuJrAuE9ZOIe0XxRSYjRcqkrVsVo713wsmo+wUDL9EQAY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHM3B-0003fb-HY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 13:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D54FD6014C;
 Mon, 27 Apr 2026 13:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD8FC2BCB4;
 Mon, 27 Apr 2026 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777296650;
 bh=03W80pIWVWG5o5UNqlq/tIYlCj2935WYMgLISQY0J+8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dftlO/sjUHBB53HxpiOwjQgvxQcH8Rgr8BHjy7bklMjOKGP7VMwxXvGjvnK1gKH+A
 LCk7hHw8jf4QO2+QOlmPqEeShr/kz0sS6XQMYA6CJWOMBgesi237U/30L5SeFDcNI5
 oWB3cDtyaPSn3SJoAnA6ZdIw9aiXO9mmsQiPpa0yKEtm/b14BqT57tbJp+bq46drAL
 HW+G7p92gxsC3dBsKspT5giWs0SQiYJah+3K+5iDI+CEvpbAhQj3PAsE9rNxFLjpqu
 9TzkhGWVW8Y/0CK67qqsocBgivvhr+ZzMehuGclPVpISyplfqwiYMdhJ3qVaMf79ow
 hXfbIlCBlJqJQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 9EBB8F40084;
 Mon, 27 Apr 2026 09:30:48 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Mon, 27 Apr 2026 09:30:48 -0400
X-ME-Sender: <xms:CGXvadxt2wdw8um2C_FldexfTHG2a_BWlEE_4pL26QlgkVGgm4NRMA>
 <xme:CGXvaYFCgGeuXImAgatV2cE6NaxoQVjNdbYwyNeC-YTWY-ekLAbECqhdDMD_DoiMW
 k9m6sM-kYg4B-PgwN3zVDTCj_E27-H6xIVwsOv_OueAFQGZerzcY7Cs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeekudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdevhhhutghk
 ucfnvghvvghrfdcuoegtvghlsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
 eptdeljeehtefhleeghfejgfetieethedugfeiveffgeekjeekvedvleeigedvueejnecu
 ffhomhgrihhnpehsrghshhhikhhordguvghvnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomheptghhuhgtkhhlvghvvghrodhmvghsmhhtphgruhht
 hhhpvghrshhonhgrlhhithihqdduieefgeelleelheelqdefvdelkeeggedvfedqtggvlh
 eppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthho
 peefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgvnhhoiihhrghtshhkhi
 estghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtoheprgguihhlghgvrhdrkhgvrhhnvghl
 seguihhlghgvrhdrtggrpdhrtghpthhtohepshhlrghvrgesughusggvhihkohdrtghomh
 dprhgtphhtthhopehrohhnnhhivghsrghhlhgsvghrghesghhmrghilhdrtghomhdprhgt
 phhtthhopegrnhhnrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrrghunhgvrh
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptggvmheskhgvrhhnvghlrdhorhhgpdhr
 tghpthhtoheptghhrghosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegujhifohhngh
 eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CGXvaX8tBzgQztb9zSDQ76htesdgV6Vy50k_XUzdXlbMrKViYGRcLA>
 <xmx:CGXvafGXQX9GnYmK00efpJNIia8RGnt5no7ofoofBc6aBUMO76caGA>
 <xmx:CGXvaeY9TVr2qcEQtevQDZAOM3PhZ60kvZ80aZyDv7XZa90PsBnYrQ>
 <xmx:CGXvabNG889hC2q-Vkkt-bdWC3vUWvYgKi3-o-BGPCmTHb-y9t0Ysg>
 <xmx:CGXvaXzXxohsjC-OhEuqud4KdFLo8XT-e-9JXsvOgnCcjmbNJS4e-DFk>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 6D33F780070; Mon, 27 Apr 2026 09:30:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASNSHzdsFZdw
Date: Mon, 27 Apr 2026 09:30:28 -0400
To: "Jan Kara" <jack@suse.cz>
Message-Id: <af3f7518-7501-4c25-9bbc-a8fc8cdb4e29@app.fastmail.com>
In-Reply-To: <yc7ygk6w6zvf46arzzvmxnuoqjrni2dtlhmywaivzmvfxnilf3@xv7tthtrowns>
References: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
 <yc7ygk6w6zvf46arzzvmxnuoqjrni2dtlhmywaivzmvfxnilf3@xv7tthtrowns>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 27, 2026, at 6:55 AM, Jan Kara wrote: > On Fri
 24-04-26 21:53:02, Chuck Lever wrote: >> Changes since v10: >> - cifs: Source
 case-handling flags from the server's cached >> FS_ATTRIBUTE_I [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sashiko.dev]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHM3B-0003fb-HY
Subject: Re: [f2fs-dev] [PATCH v11 00/15] Exposing case folding behavior
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
Cc: Paulo Alcantara <pc@manguebit.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>, Roland Mainz <roland.mainz@nrubsig.org>,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, Steve French <sfrench@samba.org>,
 Viacheslav Dubeyko <slava@dubeyko.com>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>, Shyam Prasad N <sprasad@microsoft.com>,
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
X-Rspamd-Queue-Id: 70D2847370B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.10 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:djwong@kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:stfrench@microsoft.com,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,zeniv.linux.org.uk,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,sashiko.dev:url];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]


On Mon, Apr 27, 2026, at 6:55 AM, Jan Kara wrote:
> On Fri 24-04-26 21:53:02, Chuck Lever wrote:
>> Changes since v10:
>> - cifs: Source case-handling flags from the server's cached
>>   FS_ATTRIBUTE_INFORMATION reply instead of the nocase mount
>>   option, with a nocase fallback when the reply is absent
>> - Address findings from sashiko(gemini-3) and gpt-5.5:
>>   - nfs: Skip pathconf case bits on NFSv4 (set via FATTR4_CASE_*
>>     instead)
>>   - xfs: Hide FS_CASEFOLD_FL from the legacy flags view so
>>     chattr round-trips do not hit the setflags whitelist
>>   - ext4, f2fs: Drop redundant fileattr_get patches; the
>>     FS_CASEFOLD_FL translation in fileattr_fill_flags() already
>>     reports FS_XFLAG_CASEFOLD for casefolded directories
>
> Err, how is this supposed to work? I wasn't able to find any code
> transforming S_CASEFOLDED inode flag into FS_CASEFOLD_FL on fileattr_get
> path. Sure, fileattr_fill_flags() takes care of setting FS_XFLAG_CASEFOLD
> once FS_CASEFOLD_FL is set. What am I missing?

Agreed, that is a little surprising.

The path does not go through S_CASEFOLD.  Both filesystems
report FS_CASEFOLD_FL straight from their on-disk flag word.

For ext4, EXT4_CASEFOLD_FL is 0x40000000, the same bit value
as FS_CASEFOLD_FL, and it is included in EXT4_FL_USER_VISIBLE.
ext4_iget() loads it into ei->i_flags directly from
raw_inode->i_flags (fs/ext4/inode.c:5358). ext4_fileattr_get()
then masks with EXT4_FL_USER_VISIBLE and hands the result to
fileattr_fill_flags(), which translates FS_CASEFOLD_FL into
FS_XFLAG_CASEFOLD on the way out.

For f2fs, f2fs_fileattr_get() runs fi->i_flags through
f2fs_iflags_to_fsflags(), whose mapping table has an explicit
{ F2FS_CASEFOLD_FL, FS_CASEFOLD_FL } entry (fs/f2fs/file.c:2205).
F2FS_GETTABLE_FS_FL includes FS_CASEFOLD_FL, so
fileattr_fill_flags() again lights up FS_XFLAG_CASEFOLD.

S_CASEFOLD is a separate VFS-level cache that
ext4_set_inode_flags() and f2fs's equivalent set at iget
time; nothing on the fileattr_get path consults it.

For reference, the original observation about the manual
assignment being redundant came from sashiko's review of v10:

  https://sashiko.dev/#/patchset/20260423-case-sensitivity-v10-0-c385d674a6cf%40oracle.com?part=8                                             
  https://sashiko.dev/#/patchset/20260423-case-sensitivity-v10-0-c385d674a6cf%40oracle.com?part=12  


-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
