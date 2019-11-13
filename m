Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A2FB9EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 21:32:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUzIz-0004MR-JW; Wed, 13 Nov 2019 20:31:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iUzIx-0004M6-NU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m36r+90O+fne/FepGPD3lvgEwCieTTyAnaSNQ9YyZfM=; b=Kxus6JXKawdBaqS180gsGX3+vR
 /zz5ReoDjJr/BONO/mGSVokYvhr1Q262rBD3Ow6pPNh6ykypR9uRX7BXm51guGdx3HOW+hgqOfa/F
 OTh3GY5vqV07iq5ILzYHZU358GSmNcE0B/ld6lWm3uPKJ3hmRJ+ZU1RvALt8H2slwDYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m36r+90O+fne/FepGPD3lvgEwCieTTyAnaSNQ9YyZfM=; b=Suq6reZFvalnSrgcj2C/O18Dvw
 0HPvKz9zC4lxVuJdgbsaCZK4pJtH3s6Mk4r2fN9QzCqQlio81MlXmyVWSPbpdr0+wk4i7oYUHgnkv
 lGI9Y14uZXIUBUzTGNBmXu+v4Q4yttzTjai2rf5bmdYQGtPHmLd//8XBfXrNXFgykujg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUzIw-00FYBI-CH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:31:55 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A2A2206EC;
 Wed, 13 Nov 2019 20:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573677109;
 bh=05ooIT3YbJ/fHw6k555x4s32E0dixclBOdSSgJz8rso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S0mHiSipc5QBPv7QRZhJSWtDlMjLjk4z2sj+8cfsJMlOx/sVhBWJ8dS/+N7+yNVDb
 KF55x6fWjF9icemuoHDIDMBKOw2FsurKp16lRC1XNpJ6c7gHewEtwBegNRXI6heVW6
 48kWapw6ynxD6/+2aK+SQYPQ3WRFiOxsU29zFvvY=
Date: Wed, 13 Nov 2019 12:31:47 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: walter harms <wharms@bfs.de>
Message-ID: <20191113203145.GH221701@gmail.com>
Mail-Followup-To: walter harms <wharms@bfs.de>, linux-man@vger.kernel.org,
 darrick.wong@oracle.com, dhowells@redhat.com, jaegeuk@kernel.org,
 linux-api@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 tytso@mit.edu, victorhsieh@google.com
References: <20191107014420.GD15212@magnolia>
 <20191107220248.32025-1-ebiggers@kernel.org>
 <5DC525E8.4060705@bfs.de> <20191108193557.GA12997@gmail.com>
 <5DC714DB.9060007@bfs.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5DC714DB.9060007@bfs.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUzIw-00FYBI-CH
Subject: Re: [f2fs-dev] [man-pages RFC PATCH] statx.2: document
 STATX_ATTR_VERITY
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
Cc: linux-man@vger.kernel.org, tytso@mit.edu, darrick.wong@oracle.com,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 dhowells@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 victorhsieh@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 09, 2019 at 08:34:51PM +0100, walter harms wrote:
> Am 08.11.2019 20:35, schrieb Eric Biggers:
> > On Fri, Nov 08, 2019 at 09:23:04AM +0100, walter harms wrote:
> >>
> >>
> >> Am 07.11.2019 23:02, schrieb Eric Biggers:
> >>> From: Eric Biggers <ebiggers@google.com>
> >>>
> >>> Document the verity attribute for statx().
> >>>
> >>> Signed-off-by: Eric Biggers <ebiggers@google.com>
> >>> ---
> >>>  man2/statx.2 | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> RFC since the kernel patches are currently under review.
> >>> The kernel patches can be found here:
> >>> https://lkml.kernel.org/linux-fscrypt/20191029204141.145309-1-ebiggers@kernel.org/T/#u
> >>>
> >>> diff --git a/man2/statx.2 b/man2/statx.2
> >>> index d2f1b07b8..713bd1260 100644
> >>> --- a/man2/statx.2
> >>> +++ b/man2/statx.2
> >>> @@ -461,6 +461,10 @@ See
> >>>  .TP
> >>>  .B STATX_ATTR_ENCRYPTED
> >>>  A key is required for the file to be encrypted by the filesystem.
> >>> +.TP
> >>> +.B STATX_ATTR_VERITY
> >>> +The file has fs-verity enabled.  It cannot be written to, and all reads from it
> >>> +will be verified against a Merkle tree.
> >>
> >> Using "Merkle tree" opens a can of worm and what will happen when the methode will change ?
> >> Does it matter at all ? i would suggest "filesystem" here.
> >>
> > 
> > Fundamentally, fs-verity guarantees that all data read is verified against a
> > cryptographic hash that covers the entire file.  I think it will be helpful to
> > convey that here, e.g. to avoid confusion with non-cryptographic, individual
> > block checksums supported by filesystems like btrfs and zfs.
> > 
> > Now, the only sane way to implement this model is with a Merkle tree, and this
> > is part of the fs-verity UAPI (via the file hash), so that's where I'm coming
> > from here.  Perhaps the phrase "Merkle tree" could be interpreted too strictly,
> > though, so it would be better to emphasize the more abstract model.  How about
> > the following?:
> > 
> > 	The file has fs-verity enabled.  It cannot be written to, and all reads
> > 	from it will be verified against a cryptographic hash that covers the
> > 	entire file, e.g. via a Merkle tree.
> > 
> 
> "feels" better,. but from a programmers perspective it is important at what level
> this is actually done. To see my point look at the line before.
> "encrypted by the filesystem" mean i have to read the documentation of the fs first
> so if encryption is supported at all. Or do i think to complicated ?
> 

It's filesystem-specific whether encryption and verity are supported.  I'm not
sure what your concern is, as statx() won't return the bits if the filesystem
doesn't support them.

Also note, if someone really wants the details about fscrypt and fsverity, they
really should read the documentation we maintain in the kernel tree [1][2].

[1] https://www.kernel.org/doc/html/latest/filesystems/fscrypt.html
[2] https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
