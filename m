Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFqzEgSCemnx7AEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 22:39:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0715A9284
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 22:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tdc31kprMUXrL8Q36d377EvpOAaJ8daWXDchui8+j9A=; b=JlP81faoN69l8yIY6mMwzeYBDu
	cAROxb6TUEJhQ2XvnzxV0aDGj36RT9Clyss1f7haGcqTZ/MH1kz4kGy8X+lOUfwQgl3ePUpMgtXqk
	Vg242Bk+mkSaRqg/V70X2j5rNmD2v1uOIVwX9ga4reTN1bjvi6Ld9E7jQEF+Sxn4BDCA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlDFk-0004LK-7v;
	Wed, 28 Jan 2026 21:39:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vlDFi-0004LD-Ec
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 21:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFY20aXr4oyNthpI0ftb5zOXTh8Shnm4hJYKYI7JCmo=; b=Z6MpV4htWg+WQmpSNLEEPZiY07
 rNom0Bv9beDsAnyl43sa+r7GA7IAj8EjnUyJ8pfiHzUnrlQp8wZyV9mwe+T+22mvjjMNcv2WJovGW
 l97dsmsOSpIaW+zV4ncxG9msYwP/+cRBdnthA38FyvqfCzStGwGWLmsuGqI3uCVarT28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LFY20aXr4oyNthpI0ftb5zOXTh8Shnm4hJYKYI7JCmo=; b=KIFQvk4xpYYhlaLzf+elyvmqEA
 lx3+xgciRnKEOFP/A5iL6eu40zGBrFlIBq1AKdYNiCocVwamkN/vEfVBo5G6lxc29gdPSF6MccC3d
 S6WTtNifX53pftTa7QGn9RjzfxIgc2k+jHlSUJX4tKc/HHDHk23nj9pZO1QlQPieA7tc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlDFi-0003Zc-0R for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 21:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LFY20aXr4oyNthpI0ftb5zOXTh8Shnm4hJYKYI7JCmo=; b=W/YX9qgEQwrUf4tYRGEF1H+S8F
 ptwtJynZTZ9puxoo5CBVM5H7tjZd2cDu8aIFH8SI0yND5nDzkDI0XUrbWW+TAC/vlJHMuYjviuHz0
 PtqkjeP5hNuFg6RVTzVJFEncEQZrqvTkQ0N5N8SheTBIcjCVeFAl4eNsnPVSaJ70vSmOhXKWIbjbc
 Pt60oMyUxrRtOKPSQ39fmeRpuCZi/jbXIhDlr6M8dCukDQR1QbhbtQM4qE2cN53K0qfsKNLan1ZW+
 FFtSR8O10b2e34uT4G8YwmZV5g/BRpBykoSbmI+5XAbIMt6hcyp7P7GRy365lb7EyrdLG+qdMuS65
 dkoLvbrw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vlDFV-00000009e0I-3Xv1;
 Wed, 28 Jan 2026 21:38:53 +0000
Date: Wed, 28 Jan 2026 21:38:53 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aXqB7Wlfx62bAjqF@casper.infradead.org>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de> <20260125013104.GA2255@sol>
 <aXaPph6Yi-hzf0J-@casper.infradead.org>
 <20260126044432.GE30803@lst.de> <20260126201206.GA30838@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126201206.GA30838@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 12:12:06PM -0800, Eric Biggers wrote:
 > When CONFIG_FS_VERITY=n, there can still be inodes that have fsverity >
 enabled, since they might have already been present on the files [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vlDFi-0003Zc-0R
Subject: Re: [f2fs-dev] [PATCH 11/11] fsverity: use a hashtable to find the
 fsverity_info
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=casper.20170209];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid]
X-Rspamd-Queue-Id: E0715A9284
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:12:06PM -0800, Eric Biggers wrote:
> When CONFIG_FS_VERITY=n, there can still be inodes that have fsverity
> enabled, since they might have already been present on the filesystem.
> The S_VERITY flag and the corresponding IS_VERITY() macro are being used
> to identify such inodes and handle them appropriately.  
> 
> Consider fsverity_file_open() for example:
> 
> static inline int fsverity_file_open(struct inode *inode, struct file *filp)
> {
> 	if (IS_VERITY(inode))
> 		return __fsverity_file_open(inode, filp);
> 	return 0;
> }
> 
> When CONFIG_FS_VERITY=n, __fsverity_file_open() resolves to the stub:
> 
> static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
> {
> 	return -EOPNOTSUPP;
> }
> 
> So the result is that on a kernel that doesn't have fsverity support
> enabled, trying to open an fsverity file fails with EOPNOTSUPP.

... why?  If the user has built a kernel without VERITY support enabled,
they're no longer allowed to open files with verity metadata?  I can't
see the harm in allowing them to read these files, they're just not
protected against these files being corrupted.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
