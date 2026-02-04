Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JFfO7pdg2mJlQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 15:54:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDBE7923
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 15:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0SA70nkWmrSwoOccyFjyXThPSlrJtuHgxHz7VehJFk=; b=L7xJxmAV9HDv0W9KIPNavWlNJV
	ovrlcpi8YdZJrgk6CNIrHR6gn6SeDS8vmKtI9ECFRKqgbNNm8SDUsTE5s37QAdTLOIITnfYc1PaX+
	q3yCwFfuB/1xFWy5SE/lTQPpnBEzvyd9+9gQfBj0W4CSHTCN+IegV96J4pfJsMebJT5o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vneH7-00073f-Pe;
	Wed, 04 Feb 2026 14:54:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vneGy-00073R-SC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 14:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NSFwipYtJGppFo1niPpuRr+jtuErqeP9kDtjaWPeRb4=; b=bnYdGjO7rv8rMQnRHDlqIKZxju
 A7ze+TbLlzyB501I/YK7tui7UxCNUQE2zKw7jwvKjykeDzG5c6exFnlEv7ke4BmZNCeGe5hwqYh9P
 8L+F9VUzeuR9YhmB9a0/Mg6I/zLt4dmicFDd4rBTU7mtCY3y3NUpGAcaeZ5lfNZfZ4rA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NSFwipYtJGppFo1niPpuRr+jtuErqeP9kDtjaWPeRb4=; b=L6wtB1l8F8iMhSP0+0nnrnhXQT
 TJUuiNJmNgJ3mZW0g2D4Q77lpgxUDZ8LJt4KhYmVS1OD5/iNExF5GxmjwXoy2mAkLMfcTe0mWxgWY
 zc8+MWCCo9GuKZQrW+t8to1kyLmbieXNPXRbnNd8rCJY/9jIULAwopwtbenJMekaSBns=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vneGy-0002pL-OG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 14:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NSFwipYtJGppFo1niPpuRr+jtuErqeP9kDtjaWPeRb4=; b=oxZnN3K5faDjoL5v5OXKHO0/5B
 ALVraMASeOdO1r04MRFOfO4rurUs6RmI865xOx4yso0ar7+P20MsCkTabs1ya5R7FJMXs0ce/Ez/q
 rbw7GcQz34Rv1Uu4uCXSYS/vjKmtDX7MWB90vI8Y6XrnLPQCQXb9VQLbaHpe2XJ1FOsYrzz4EAtTD
 0pejcPBsHfrRajM4IfKrqCUr02C6nMxD982pRJhIo8toILLn2rYjgRPmHchK/LCdN/5qjKs6HNCj7
 f/o5jziZ7q20pft0KQB2Xb21eynAKosZ7IXbGzJcIEHSVLJzQUdCffAiCsqVd3oLW659nU25c/4ST
 czQtWaFQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vneGo-00000002DxS-1MWR;
 Wed, 04 Feb 2026 14:54:18 +0000
Date: Wed, 4 Feb 2026 14:54:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aYNdmk1EE5etfUYE@casper.infradead.org>
References: <20260202060754.270269-1-hch@lst.de> <20260202211423.GB4838@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202211423.GB4838@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
 > - Used the code formatting from 'git clang-format' in the cases where it
 > looks better than the ad-hoc formatting clang-format makes some bad choices.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vneGy-0002pL-OG
Subject: Re: [f2fs-dev] fsverity speedup and memory usage optimization v5
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[casper.infradead.org:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 95EDBE7923
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
> - Used the code formatting from 'git clang-format' in the cases where it
>   looks better than the ad-hoc formatting

clang-format makes some bad choices.

>  static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
> -		struct readahead_control *rac, struct folio *folio)
> +				struct readahead_control *rac,
> +				struct folio *folio)

Aligning to the opening bracket is one of them.  If anything changes
in a subsequent patch (eg function name, whether or not it's static,
adding a function attribute like __must_check, converting the return
type from int to bool), you have to eitheer break the formatting or
needlessly change the lines which have the subsequent arguments.

Also, you've consumed an extra line in this case.  Just leave the
two tab indent, it's actually easier to read.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
