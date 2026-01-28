Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJbdMziGeWnjxQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:44:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DC9CD36
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLIbX5zwb97YQJhkiksXQ3famanmCs4tbLzN9l4orAE=; b=IY9gPuyVvcZ/JFOWADnwvjGd9R
	Rt6MacZJHU+TAc/LSao6CVURQLp+iBcAOLinRv9l3wXd2/hG7GM9ZXNbOvpjO/Meu7Ydsg08F7dyn
	PAMwC+jSu1QGrL3mxmi0OV5zrmhSWBfULxTzwvu9TXupWslLtnWfgy0i1rJ9QqSge4kc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkwU6-0000Ol-NO;
	Wed, 28 Jan 2026 03:44:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkwU5-0000OV-7I
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/LXIytMX+jd09O4G3j3iiwkfz4Rqdfw0zKOmNAceMmo=; b=SI8ZTZ2/r5QJoo6DQcyVtJLrS6
 /fqDGqtmdIRFjgOzqpHa5gPBWPIPLghfVU9HL/Pm9bP2WPijJJmNyQtSADSwLbelpnYSYJQ7DSTSr
 rtdFFUIhwiR5ddijBLw+lqEvrgsJfNxN9xGOSTs1rqWYGEBWzUJg0WfXW0D6xgB8AQNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/LXIytMX+jd09O4G3j3iiwkfz4Rqdfw0zKOmNAceMmo=; b=R69/AIWjGHNJiIOM70lSYfxEyf
 XUn1pVujPDLneT7+fx2uk1LOydLEkfN6b84P5opCYVuKEoISc1Rr/WKegthJpIgJ6CvET9dIFmi4X
 giriDI1KqJkmGzFjnpGq+22rOxAwrNJ1c+nNUxZlXDivb6BC8VYXDvHdVv+0iws3Q52U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkwU5-0001A7-KP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C2C260007;
 Wed, 28 Jan 2026 03:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388A4C4CEF1;
 Wed, 28 Jan 2026 03:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769571878;
 bh=AxsbRiz6g5OHmI8dfGU8IScrv9tHBdspZu1p6bmeGBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P201+ebcahtveats5bhW2VJNT2y5qzZhA5UQq4K1H1t4r3j8dB204ErQtUZ4OVk7N
 YnWXZUkXX1CbW8uko3pPh+QLq4pWZLsSBJA9PvkIniP9ouFclwLqq3s7rzdJdnahiv
 F8uNjLjPV7RhubK6C9IlB690qAzIOrBIS168z1Jj9DAw594M2kV1u1lIAtTaU6frsL
 YVjDJT63xqbvutBpXCtTvsieBy0dKR44T1c1fyeRrNuX51xye8cn2hCQKzBf/PGuN2
 y3G1FufZ7pMbsRJS+GieYovcevovNHI/9hjK7cqJDIpSxdqJz1BNQ/LggEt/fIz2Yr
 VqO+Ot3ttWEuA==
Date: Tue, 27 Jan 2026 19:44:05 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260128034405.GD2718@sol>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-17-hch@lst.de> <20260128032817.GB2718@sol>
 <20260128033519.GB30830@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128033519.GB30830@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 04:35:19AM +0100, Christoph Hellwig
 wrote: > > Is there a reason for this function in particular to be
 __always_inline?
 > > fsverity_get_info() is just inline. > > Without the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkwU5-0001A7-KP
Subject: Re: [f2fs-dev] [PATCH 16/16] fsverity: use a hashtable to find the
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 6A2DC9CD36
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:35:19AM +0100, Christoph Hellwig wrote:
> > Is there a reason for this function in particular to be __always_inline?
> > fsverity_get_info() is just inline.
> 
> Without the __always_inline some gcc versions on sparc fail to inline it,
> and cause a link failure due to a reference to fsverity_readahead in
> f2fs_mpage_readpages for non-verity builds.  (reported by the buildbot)

The relevant code is:

    vi = f2fs_need_verity(inode, folio->index);              
    if (vi)                                                  
            fsverity_readahead(vi, folio, nr_pages); 

Where:

    f2fs_need_verity()
        => fsverity_get_info()
            => fsverity_active()

If fsverity_active() needs __always_inline, why don't the other two
functions in the call chain need it?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
