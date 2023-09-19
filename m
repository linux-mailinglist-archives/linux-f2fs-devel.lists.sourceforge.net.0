Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8787A6C7F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Sep 2023 22:46:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qihcI-0000lT-Bb;
	Tue, 19 Sep 2023 20:46:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qihcG-0000lN-Vo
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 20:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Oq9r5r2xAoTCHNL1vl2zSAFYfwjFL747s/IzDVzwbJQ=; b=JBeMYWgcwDZzUjDM9bo13P/1xu
 Eu7uzPzKyPPkQOFOlASOn5NF+rtuUGuvMB4yKWKgocxAaUyZEo8Cg+tFr2v4HVkeWyk091gFt8UBt
 a2bVsk27A//a3diPrXCUcJCR+Tlaz9hCwW7Vr3WcBngQATNGoAg6WPLAlxzbwjw9Onus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Oq9r5r2xAoTCHNL1vl2zSAFYfwjFL747s/IzDVzwbJQ=; b=ZqRtADdnpLQzoeeNw7F1aqWST4
 kNR1eCwUkCcviE8JsasxfRD7Z6gEMOMKTWXbXfH+hvnrgvsODTBz7RJWFVwYcE3NU1rRU6tM65W6u
 qbn9hObZea1l7lphzpJTS2q0Otfk9B2v5plXg9MCoJJ4D74Kw/j7dazp0o0Hr/s/Y3AM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qihcF-00FORY-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Sep 2023 20:46:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2E59617B9;
 Tue, 19 Sep 2023 20:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A819FC433C9;
 Tue, 19 Sep 2023 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695156393;
 bh=BmRXQZIEgC13FrkspW8zNhSJjLbclay0bgLqEV3Rrl8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=q9KdgZu946MZfw7DxJLZIxiiIbHL9p62pycuILxZHzw8MqP3sd2qzr3E/ZkzfhbEv
 Sv560WUNQE0HlwP/5rEqpm3bw7jCmrV5akvxgau1zBqN4rLOK+/ZjoboBONeleNI+5
 6SP6lExUu15oD0xQisxQolfz9bgwYx59X/D7X0LTGvi5p2a+XVoY+oMnByTr4quQRa
 dZXyYP7t6FAFej2yuwhu+Ce8pxPjyRxtNPk1CXlFaDLgBYYr9H9mjHCggTcasxMD+A
 UZV+ik47sNRSAwVomJhe40/Ndx/tHAngLhTIM40zYtZFnzpPzdTJ314IhHsCYJFhNI
 PFuADp6gLFx9g==
Message-ID: <6e6da8a875a0defec1a0f58314995a6a12dca74e.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>, Bruno Haible <bruno@clisp.org>, Jan
 Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>,
 bug-gnulib@gnu.org
Date: Tue, 19 Sep 2023 16:46:25 -0400
In-Reply-To: <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2023-09-19 at 13:10 -0700, Paul Eggert wrote: > On
 2023-09-19 09:31,
 Jeff Layton wrote: > > The typical case for make > > timestamp
 comparisons is comparing source files vs. a build target. If [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qihcF-00FORY-Nm
Subject: Re: [f2fs-dev] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Benjamin Coddington <bcodding@redhat.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bo b Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2023-09-19 at 13:10 -0700, Paul Eggert wrote:
> On 2023-09-19 09:31, Jeff Layton wrote:
> > The typical case for make
> > timestamp comparisons is comparing source files vs. a build target. If
> > those are being written nearly simultaneously, then that could be an
> > issue, but is that a typical behavior?
> 
> I vaguely remember running into problems with 'make' a while ago 
> (perhaps with a BSDish system) when filesystem timestamps were 
> arbitrarily truncated in some cases but not others. These files would 
> look older than they really were, so 'make' would think they were 
> up-to-date when they weren't, and 'make' would omit actions that it 
> should have done, thus screwing up the build.
> 
> File timestamps can be close together with 'make -j' on fast hosts. 
> Sometimes a shell script (or 'make' itself) will run 'make', then modify 
> a file F, then immediately run 'make' again; the latter 'make' won't 
> work if F's timestamp is mistakenly older than targets that depend on it.
> 
> Although 'make'-like apps are the biggest canaries in this coal mine, 
> the issue also affects 'find -newer' (as Bruno mentioned), 'rsync -u', 
> 'mv -u', 'tar -u', Emacs file-newer-than-file-p, and surely many other 
> places. For example, any app that creates a timestamp file, then backs 
> up all files newer than that file, would be at risk.
> 
> 
> > I wonder if it would be feasible to just advance the coarse-grained
> > current_time whenever we end up updating a ctime with a fine-grained
> > timestamp?
> 
> Wouldn't this need to be done globally, that is, not just on a per-file 
> or per-filesystem basis? If so, I don't see how we'd avoid locking 
> performance issues.
> 

Maybe. Another idea might be to introduce a new timekeeper for
multigrain filesystems, but all of those would likely have to share the
same coarse-grained clock source.

So yeah, if you stat an inode and then update it, any inode written on a
multigrain filesystem within the same jiffy-sized window would have to
log an extra transaction to write out the inode. That's what I meant
when I was talking about write amplification.

> 
> PS. Although I'm no expert in the Linux inode code I hope you don't mind 
> my asking a question about this part of inode_set_ctime_current:
> 
> 	/*
> 	 * If we've recently updated with a fine-grained timestamp,
> 	 * then the coarse-grained one may still be earlier than the
> 	 * existing ctime. Just keep the existing value if so.
> 	 */
> 	ctime.tv_sec = inode->__i_ctime.tv_sec;
> 	if (timespec64_compare(&ctime, &now) > 0)
> 		return ctime;
> 
> Suppose root used clock_settime to set the clock backwards. Won't this 
> code incorrectly refuse to update the file's timestamp afterwards? That 
> is, shouldn't the last line be "goto fine_grained;" rather than "return 
> ctime;", with the comment changed from "keep the existing value" to "use 
> a fine-grained value"?

It is a problem, and Linus pointed that out yesterday, which is why I
sent this earlier today:

https://lore.kernel.org/linux-fsdevel/20230919-ctime-v1-1-97b3da92f504@kernel.org/T/#u

Bear in mind that we're not dealing with a situation where the value has
not been queried since its last update, so we don't need to use a fine
grained timestamp there (and really, it's preferable not to do so). A
coarse one should be fine in this case.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
