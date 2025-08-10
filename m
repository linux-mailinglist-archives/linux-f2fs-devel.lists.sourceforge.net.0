Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4DB1FB52
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 19:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxutGY5a9TrPOFymCgE4vdZgR4Yy4wdwisxRlaQgBFM=; b=jRTAIog+8fWxzXN0ah+aJm7KsC
	XqxdRJKMaLloHOnfXFgKQdCI0ZAoATpq5NNw1WStkOLfAjQ42NxnEWRLXNlQb+pBHtZLuINv8M84x
	OmqPqrVM72KHm0Q7Ju8YBSgyolXaQ21jMdXAZn+sn1/4gGoHBMr5KMYeuEWmkLg5KB+g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul9db-0005I3-T6;
	Sun, 10 Aug 2025 17:15:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f8289c006d63a7a0c32a+8022+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ul9ci-0005Gb-3d for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 17:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eba9/UNtFbnbTotdmRwgRDpHHtnU1GYOs19ZmRBWF2o=; b=JduHJkHaY6HafHGiojR9cvJsZt
 Vo6/WGc10ISnbdNqp/suSZ02rtyXkgLV0G8Vu8fyc0HBT4QWQdhSzk0NvDJZBCjYZkaFLrayN3GNa
 6pTnBJtJEIipqJqoK53P63CRbtPk7cK9QxD/ZCQD7TLXkp47EGQdReWwZkOJHJobUPPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eba9/UNtFbnbTotdmRwgRDpHHtnU1GYOs19ZmRBWF2o=; b=h7RgNDxjZTzlf3jXYiDo9xDONR
 K3dR8TqvWt4LQmK9uze70mR97FVJZTaUVnk2mV9UBguiochY1VKKHP88uVuAkQy+2vsL+6DSNHIWP
 U/IQfJbD78Pm7nx6qdehMulntf+SaZzibUyAzKpmZmVUfubUoBEPUZle6+0R9BsI4hA0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul9ch-0001dT-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 17:14:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eba9/UNtFbnbTotdmRwgRDpHHtnU1GYOs19ZmRBWF2o=; b=hecelpqmlnsZkhT+OLx5/HpbXr
 RG97h7KFiWryT3kIqWxgwPsicKfM4Is5hZpZ1sBdwXPFO6sMg6eGoaFrhbwgjFNGCXA4bt1BNJBC6
 7VyhJAmuCE7KxYT2WXqprZ6lSIsZvB2HNEkYjhhA6d4/UQM007+vndtSdvKOc8quT9Nk09djK0FpN
 H8EUGCKmjMDLYefs2C4QsrtbwJ5Pwti17S8zbYkI6BRQmcGm4g0cINVfr15VZ/uG243Oj2pzYK6hv
 jNrtUoRha9VcTMSM0HgujT2Ac3E8VQawRllgjnpbLcsAWUBVrNxj+i+ukV2F7xYKsLI0Xl/GwXloB
 wUzLZSJw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ul9cc-00000005pRq-0pCw;
 Sun, 10 Aug 2025 17:14:14 +0000
Date: Sun, 10 Aug 2025 10:14:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aJjTZg-VOaZ_2k2H@infradead.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <aJixkUfWPo5t8Ron@infradead.org> <20250810170311.GA16624@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810170311.GA16624@sol>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 10, 2025 at 10:03:11AM -0700, Eric Biggers wrote:
 > I assume you actually still mean fsverity, not fscrypt. Yes, sorry. > First, 
 it would > be helpful not to use one solution for fscrypt and a totally
 different
 > solution for fsverity, as that would increase the maintenance cost well
 > beyond that of either solution in [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ul9ch-0001dT-NQ
Subject: Re: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out
 of struct inode
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
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 10, 2025 at 10:03:11AM -0700, Eric Biggers wrote:
> I assume you actually still mean fsverity, not fscrypt.

Yes, sorry.

> First, it would
> be helpful not to use one solution for fscrypt and a totally different
> solution for fsverity, as that would increase the maintenance cost well
> beyond that of either solution individually.

I agree that reducing the number of infrastructures is a goal.  But I
don't think we should limit us to a single "solution" for different
kinds of problems.

> 
> Second, the fsverity info can be loaded very frequently.  For example,
> curently it's loaded for each 4K data block processed.

Well, we can easily keep a once looked up data structure around for
any operation that does not leave file system control.  So for writing
that's a single ioctl context.  For read that is a single call into
->readahead, or maybe even ->read_iter.

> Also, there
> *are* use cases in which most files on the filesystem have fsverity
> enabled.  Not super common, but they exist.

Sure.  But the typical use case is a few files, and even that is just
a tiny minority of all ext4/f2fs/xfs file systems.

> It doesn't really seem like the kind of solution that's a good choice
> for a frequently-loaded field.  And that's only the load; it's not
> getting into the insertion (and resizing) part.

Assuming you actually get it down to once per high-level operation
above, it will still be absolute noise compared to the I/O generated.

> If we're going so far as to use a rhashtable, I have to wonder why we
> aren't first prioritizing other fields.  For example ext4_inode_info
> unconditionally has 40 bytes for fast_commit information, even though
> fast_commit is an experimental ext4 feature that isn't enabled on most
> filesystems.  That's 5 times as much as i_verity_info.  And quota has 24
> bytes under CONFIG_QUOTA.  And there are even holes in the
> ext4_inode_info struct; we could also just improve the field packing!

All that does sound like a good idea, independent of what we are
discussing here.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
