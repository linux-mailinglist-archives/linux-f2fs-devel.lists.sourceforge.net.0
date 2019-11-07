Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EFAF3AFA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 23:13:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSq1Z-00055x-RV; Thu, 07 Nov 2019 22:13:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iSq1Z-00055q-82
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 22:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUx7f1YMtke6EzwxPZ46HBA3P+wruk9fVU74dHLLsvY=; b=SqMt3RanczyZ4LRioAzQWdi+zg
 9b3lnHVSsFIDAVFKrfg7E42a0WwvJU5b83x82ugk2I+gCfHQzvYGXuo/hII4M/3G1xv2+im3+1mvW
 LJCH0nCP0XXikvyPSo1Kz3vVVFB96YtK8E7ygiZLOTwWEicmMFO+HMmQKJMFYiZBCxls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dUx7f1YMtke6EzwxPZ46HBA3P+wruk9fVU74dHLLsvY=; b=ZrLSXboYQVBHSCGZhLLiT4veH0
 7Y30ifRv+PqsDiaMKAOGLRTCI2GdZ4ZBt7dpc7RM3HXGrTz7sX+wx2EcW8rC+Ys5wusTSBVqntoWw
 6XtrkAVlAmoQocoehejilQMTTrHDnHCe0iy28sbwsBMcIlJhDEEKYmZUfQYiHpUYuwJc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSq1X-005UWW-PB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 22:13:05 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D96BA2075C;
 Thu,  7 Nov 2019 22:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573164778;
 bh=sumKTTMSu0TjJWnjdn6qQq4QblYrYnTbD5OwaLmnW5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JeN+ChtHQHJOrgWAnW3PkTwaUugMas6qp/lkjPGpxmLky0BCWxxrj/L4Hw2tOllRq
 eUybTaY70haNLirl0N5ZQwGMGqohpHOdSNfxRNLs7tRlGtGPrjH7XY9Ybj6lkmA1PJ
 mA9rv2v0pQvvx0U19R4VgA8fkiHdVMcAoaLF6gsE=
Date: Thu, 7 Nov 2019 14:12:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20191107221255.GB1160@gmail.com>
Mail-Followup-To: "Darrick J. Wong" <darrick.wong@oracle.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-api@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Victor Hsieh <victorhsieh@google.com>
References: <20191029204141.145309-1-ebiggers@kernel.org>
 <20191029204141.145309-2-ebiggers@kernel.org>
 <20191107014420.GD15212@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107014420.GD15212@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.3 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSq1X-005UWW-PB
Subject: Re: [f2fs-dev] [PATCH 1/4] statx: define STATX_ATTR_VERITY
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 06, 2019 at 05:44:20PM -0800, Darrick J. Wong wrote:
> On Tue, Oct 29, 2019 at 01:41:38PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add a statx attribute bit STATX_ATTR_VERITY which will be set if the
> > file has fs-verity enabled.  This is the statx() equivalent of
> > FS_VERITY_FL which is returned by FS_IOC_GETFLAGS.
> > 
> > This is useful because it allows applications to check whether a file is
> > a verity file without opening it.  Opening a verity file can be
> > expensive because the fsverity_info is set up on open, which involves
> > parsing metadata and optionally verifying a cryptographic signature.
> > 
> > This is analogous to how various other bits are exposed through both
> > FS_IOC_GETFLAGS and statx(), e.g. the encrypt bit.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  include/linux/stat.h      | 3 ++-
> >  include/uapi/linux/stat.h | 2 +-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/stat.h b/include/linux/stat.h
> > index 765573dc17d659..528c4baad09146 100644
> > --- a/include/linux/stat.h
> > +++ b/include/linux/stat.h
> > @@ -33,7 +33,8 @@ struct kstat {
> >  	 STATX_ATTR_IMMUTABLE |				\
> >  	 STATX_ATTR_APPEND |				\
> >  	 STATX_ATTR_NODUMP |				\
> > -	 STATX_ATTR_ENCRYPTED				\
> > +	 STATX_ATTR_ENCRYPTED |				\
> > +	 STATX_ATTR_VERITY				\
> >  	 )/* Attrs corresponding to FS_*_FL flags */
> >  	u64		ino;
> >  	dev_t		dev;
> > diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
> > index 7b35e98d3c58b1..ad80a5c885d598 100644
> > --- a/include/uapi/linux/stat.h
> > +++ b/include/uapi/linux/stat.h
> > @@ -167,8 +167,8 @@ struct statx {
> >  #define STATX_ATTR_APPEND		0x00000020 /* [I] File is append-only */
> >  #define STATX_ATTR_NODUMP		0x00000040 /* [I] File is not to be dumped */
> >  #define STATX_ATTR_ENCRYPTED		0x00000800 /* [I] File requires key to decrypt in fs */
> > -
> >  #define STATX_ATTR_AUTOMOUNT		0x00001000 /* Dir: Automount trigger */
> > +#define STATX_ATTR_VERITY		0x00100000 /* [I] Verity protected file */
> 
> Any reason why this wasn't 0x2000?

Yes, as Andreas pointed out, the value is chosen to match the corresponding
FS_IOC_GETFLAGS bit, like the other bits above marked [I].

> 
> If there's a manpage update that goes with this, then...
> Acked-by: Darrick J. Wong <darrick.wong@oracle.com>
> 

It's pretty trivial to add it to the statx(2) man page.
I've sent out a patch for comment:
https://lkml.kernel.org/linux-fscrypt/20191107220248.32025-1-ebiggers@kernel.org/

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
