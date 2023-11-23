Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A07ED7F64F8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 18:13:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6DGK-0008Ux-9u;
	Thu, 23 Nov 2023 17:13:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r6DGI-0008Uo-En
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 17:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1PVt9jFHLZyJOvNOweTTAr+mfv0r2vN5F3uo83rFOeM=; b=HYVloiUp3GdBofZS3KOyehURIu
 bASHAegNBH28Qnf4HBPYBTmGicZX6D6JmwxQGw4S8kCrtt6r37cth7VGxmknZQOUkWS2mXRihptIG
 xlO4nwt+KdhLJS1KTJcWyzzAz1hZ4u+of4ZKgXi7IYTbjlIJu0c9iXfVxLD9dY7zbJDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1PVt9jFHLZyJOvNOweTTAr+mfv0r2vN5F3uo83rFOeM=; b=Bap88o3ctezhSkY5duqylDEMev
 wh25f9GKIhMaaAiDPpO0v/UhEgatl0Hj3IDVuLd52Ie74n2XK3v5y4JnBuVXVMzqcsuQEMvuqlRLy
 u6vb0QNKFJMJ1kIHQSlq4HlP6EJHJTBFgNmqcOhe5IDJOc4n2Ru5o37Jo4I/DK0ONC+c=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6DGH-00DibM-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 17:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1PVt9jFHLZyJOvNOweTTAr+mfv0r2vN5F3uo83rFOeM=; b=k5omMfobXlbs3nKnm6Y7p5XpTM
 BbyEoJZsEdpf6Kz2bX5ZuyivItc5gUHlbKeRuBPxRO6awg9VMR0KlhgNIfKsRKR/UzRSe/bCClLGL
 AGcVIHz8vx+E1GluuVF3yiR6oPl5HdWKA3vhlEmuK8jEgrwlQFsFLUbRtnDmoq8sD94sQkGIg9GmC
 DJg6ZPMC81fe7N8opXMUOA/asv/ZkU4HWTbr250Yb5sF57EqKRbDD0ioVXWfwm6gkHLjL+uZQ3rWx
 ge51hByqQ+JJaHZeNDYzTBJtG8IbmXbnj/HEEhi81q1VkMk9z1xB/7FcvPIWTJHhPGnvU1ezScJIc
 43XIg4vQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r6DG3-002Air-1I; Thu, 23 Nov 2023 17:12:55 +0000
Date: Thu, 23 Nov 2023 17:12:55 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <gabriel@krisman.be>
Message-ID: <20231123171255.GN38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <87o7fkihst.fsf@>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7fkihst.fsf@>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 23, 2023 at 10:57:22AM -0500, Gabriel Krisman
 Bertazi wrote: > Linus Torvalds <torvalds@linux-foundation.org> writes: >
 > > Side note: Gabriel, as things are now, instead of that > > > > i [...]
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r6DGH-00DibM-Ta
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 23, 2023 at 10:57:22AM -0500, Gabriel Krisman Bertazi wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> 
> > Side note: Gabriel, as things are now, instead of that
> >
> >         if (!d_is_casefolded_name(dentry))
> >                 return 0;
> >
> > in generic_ci_d_revalidate(), I would suggest that any time a
> > directory is turned into a case-folded one, you'd just walk all the
> > dentries for that directory and invalidate negative ones at that
> > point. Or was there some reason I missed that made it a good idea to
> > do it at run-time after-the-fact?
> >
> 
> The problem I found with that approach, which I originally tried, was
> preventing concurrent lookups from racing with the invalidation and
> creating more 'case-sensitive' negative dentries.  Did I miss a way to
> synchronize with concurrent lookups of the children of the dentry?  We
> can trivially ensure the dentry doesn't have positive children by
> holding the parent lock, but that doesn't protect from concurrent
> lookups creating negative dentries, as far as I understand.

AFAICS, there is a problem with dentries that never came through
->lookup().  Unless I'm completely misreading your code, your
generic_ci_d_revalidate() is not called for them.  Ever.

Hash lookups are controlled by ->d_op of parent; that's where ->d_hash()
and ->d_compare() come from.  Revalidate comes from *child*.  You need
->d_op->d_revalidate of child dentry to be set to your generic_ci_d_revalidate().

The place where it gets set is generic_set_encrypted_ci_d_ops().  Look
at its callchain; in case of ext4 it gets called from ext4_lookup_dentry(),
which is called from ext4_lookup().  And dentry passed to it is the
argument of ->lookup().

Now take a look at open-by-fhandle stuff; all methods in there
(->fh_to_dentry(), ->fh_to_parent(), ->get_parent()) end up
returning d_obtain_alias(some inode).

We *do* call ->lookup(), all right - in reconnect_one(), while
trying to connect those suckers with the main tree.  But the way
it works is that d_splice_alias() in ext4_lookup() moves the
existing alias for subdirectory, connecting it to the parent.
That's not the dentry ext4_lookup() had set ->d_op on - that's
the dentry that came from d_obtain_alias().  And those do not
have ->d_op set by anything in your tree.

That's the problem I'd been talking about - there is a class of situations
where the work done by ext4_lookup() to set the state of dentry gets
completely lost.  After lookup you do have a dentry in the right place,
with the right name and inode, etc., but with NULL ->d_op->d_revalidate.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
