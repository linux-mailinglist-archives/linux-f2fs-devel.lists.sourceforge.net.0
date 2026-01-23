Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKuoL4CWc2lgxQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 16:40:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBED77E1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 16:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Message-Id:To:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpBZ/6a+MyWqnwrS/ofLlX2M88toAByK1ZnnAGksBEk=; b=P6LiCOyLeB2hrU6tFCbzEuX43h
	kzpy00vLSickfBSA7so/5bymUI5She0ht9jWJjL27iqqaz4D0KjwpZyhlO/wsWHum5vbkOw9Vz/YA
	BaPFZK+HkeavzyC7svYwqpa0ZR3nscWM5irKAre1Y+X8yd8EhPDI1CkS6iUr0eHDsG+E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjJH0-0007WP-Q0;
	Fri, 23 Jan 2026 15:40:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vjJGz-0007WH-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 15:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:
 References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dwl1w08W3PyHZV/jSXVr79/EeteBwzlLm9ZTcFevyC8=; b=jqq3bhi3+qlz7dI3GsLwPllCcr
 vrVei1anaLIK9C9zdPgX69kw0MPk6tCVj6cMM2Pl4ereMHOl9coFf3mbsXFyGGN5wZXuxSr+57JIK
 iGyW9a9b0FsNKfWenVAoJCPqf2YNrYph425TafuigIBxzEaEUly7LWf5mgX0CLF4nKGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:References:In-Reply-To:
 Message-Id:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dwl1w08W3PyHZV/jSXVr79/EeteBwzlLm9ZTcFevyC8=; b=YdCSo32KGMq4mxHsf2+F6EIqnV
 Ppkr2LRiCDP5TXbuVQem+ENPiYB4eu3ne2tIac9WpXLsfirid0YIwYBqnNQjc8i/G4tXdDUAF+/Ip
 BGK2zlgrEJFA/3psTG3nRzhJq7k9S8Vc9mnyL00ZNw3wJhm3s7WU1uMZ8lzSKD5MaGL0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjJGy-0002Gd-Ul for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 15:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7539340183;
 Fri, 23 Jan 2026 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C132FC19423;
 Fri, 23 Jan 2026 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769182822;
 bh=ca5OUABJIUQw1awy0GFCz8SroFNXoro22G2gLfwRU4M=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=miIdbsrx/xWo97HXz/jQd5ViuIINwShbYv5Qx6eRXNyIG8yB3gaG3qsEC3ec3NRue
 Durj4sBrnWWjXrQrr5xH6oIcmO56O5emUyNuGLQ8a1IWEydvOmOU7kqM01t5OPceT1
 zG+0Ch1oWfduzSY0eJogyMLwv7U+uD29e7I3+kxKFCUuVj61KD4huJQI4bRL4FGdwB
 Q0StbeWgJeXcRI2z9tt9kiNhB6Ahm8RhACQTzrDS2k1KVc0bsvE5bborNt5lu65RPV
 j5N2SB7OE7hU/qBLJ7DVZz/2L5F8OHd/T1wd9v6yrKjTyhly4GgIB3PxfkGUIhbvit
 OSujpWPpFXXCg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 99424F40068;
 Fri, 23 Jan 2026 10:40:20 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-10.internal (MEProxy); Fri, 23 Jan 2026 10:40:20 -0500
X-ME-Sender: <xms:ZJZzaa9eivV6ZLC2S1VvjVQPBCkkSu4KwoG1yY5mRgNIWyYur9Ck5Q>
 <xme:ZJZzaVhe3sND8MoOXWzM6KbGKNU-wl2QbyrVMYOgilup7QoUs0_xsBDCg8xWETr0h
 3G1z6reNUTw9_CJt2iyf6fO5CBWZsC9dMjullwIvYdK7XZ5z1-MxMD6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeelgedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfvehhuhgt
 khcunfgvvhgvrhdfuceotggvlheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
 hnpefhffekffeftdfgheeiveekudeuhfdvjedvfedvueduvdegleekgeetgfduhfefleen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhutg
 hklhgvvhgvrhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeifeegleel
 leehledqfedvleekgeegvdefqdgtvghlpeepkhgvrhhnvghlrdhorhhgsehfrghsthhmrg
 hilhdrtghomhdpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehsvghnohiihhgrthhskhihsegthhhrohhmihhumhdrohhrghdprhgtphhtth
 hopegrughilhhgvghrrdhkvghrnhgvlhesughilhhgvghrrdgtrgdprhgtphhtthhopehs
 lhgrvhgrseguuhgsvgihkhhordgtohhmpdhrtghpthhtoheprhhonhhnihgvshgrhhhlsg
 gvrhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnnhgrsehkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
 gtvghmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhgroheskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZJZzaUw-i5v04Oo4fuTDYQJ6fy5P88Zbs1MBvOy8w-xobwZu_7vEZg>
 <xmx:ZJZzaSq2wkh834Up5x5kLjRlIaDqOo5FWP-tWiZw1Fd0qfJBikQpKQ>
 <xmx:ZJZzaR7NIuH_l3ADDuDheAkeN4vFEAcw0T7KC-Ayt0CDPdHImRMmgQ>
 <xmx:ZJZzacgEYomzp6qZbIscHRcBPtxblNQkyJKtMbmaPLb7bORokH1X7w>
 <xmx:ZJZzaf1KoDZBtl7IdcWtFdAYuDM1ZCLx7M3GXs9B37KKxuKtytwrRpxO>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 68382780075; Fri, 23 Jan 2026 10:40:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdRvsg_UpIrR
Date: Fri, 23 Jan 2026 10:39:55 -0500
To: "Christian Brauner" <brauner@kernel.org>
Message-Id: <41b1274b-0720-451d-80db-210697cdb6ac@app.fastmail.com>
In-Reply-To: <20260123-zwirn-verfassen-c93175b7a1ee@brauner>
References: <20260120142439.1821554-1-cel@kernel.org>
 <20260123-zwirn-verfassen-c93175b7a1ee@brauner>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 23, 2026, at 7:12 AM, Christian Brauner wrote:
 >> Series based on v6.19-rc5. > > We're starting to cut it close even with
 the announced -rc8. > So my current preference would be to wait fo [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjJGy-0002Gd-Ul
Subject: Re: [f2fs-dev] [PATCH v6 00/16] Exposing case folding behavior
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	NEURAL_HAM(-0.00)[-0.909];
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
X-Rspamd-Queue-Id: EBBED77E1B
X-Rspamd-Action: no action



On Fri, Jan 23, 2026, at 7:12 AM, Christian Brauner wrote:
>> Series based on v6.19-rc5.
>
> We're starting to cut it close even with the announced -rc8.
> So my current preference would be to wait for the 7.1 merge window.

Hi Christian -

Do you have a preference about continuing to post this series
during the merge window? I ask because netdev generally likes
a quiet period during the merge window.


-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
