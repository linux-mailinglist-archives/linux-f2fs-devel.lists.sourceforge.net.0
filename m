Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58F47018
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Jun 2019 14:58:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hc8G7-0002vU-B5; Sat, 15 Jun 2019 12:58:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hc8G6-0002v6-87
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Jun 2019 12:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/vTk77h7v7QpfnVbosMef/+1xP9GNMMkYPeuEW8XA94=; b=hFgW8ioemgUim2Ogl1DVOSbR6R
 tXkN40p0bN5pOLhzaXzTB9kFFuz0/PUtZ1PXmTeaw16V8RzyAULWXQzKytTxeeEJvY3SNYVuf6Dbh
 xDTr94jiX1hIZk4Aw1b2sti73xDUzYE8523KCh786MXmvHjDOjjnxgUfW/uDn132mUDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/vTk77h7v7QpfnVbosMef/+1xP9GNMMkYPeuEW8XA94=; b=AA2cfIjC+p36eUZikfr+jaGlJs
 gX2lwVsPTgKbp4MqqNNaSFbiCkH6Ac/al0mmWIqMVmw4JgCLtKGQMlU9JetfK9D+8WdkImKmBAiUk
 sL2D/hpU6YdcS10HWUsiPFOe4ckFYDmbzy6s9TrlWIQ7CDDuX2cKcmWbLOQdH87hTpgA=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hc8Fz-00EwrS-DD
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 15 Jun 2019 12:58:08 +0000
Received: from callcc.thunk.org (rrcs-74-87-88-165.west.biz.rr.com
 [74.87.88.165]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5FCvtK2003696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2019 08:57:56 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id CE108420484; Sat, 15 Jun 2019 08:57:55 -0400 (EDT)
Date: Sat, 15 Jun 2019 08:57:55 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190615125755.GG6142@mit.edu>
References: <20190606155205.2872-1-ebiggers@kernel.org>
 <20190606155205.2872-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606155205.2872-7-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hc8Fz-00EwrS-DD
Subject: Re: [f2fs-dev] [PATCH v4 06/16] fs-verity: add inode and superblock
 fields
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 06, 2019 at 08:51:55AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Analogous to fs/crypto/, add fields to the VFS inode and superblock for
> use by the fs/verity/ support layer:
> 
> - ->s_vop: points to the fsverity_operations if the filesystem supports
>   fs-verity, otherwise is NULL.
> 
> - ->i_verity_info: points to cached fs-verity information for the inode
>   after someone opens it, otherwise is NULL.
> 
> - S_VERITY: bit in ->i_flags that identifies verity inodes, even when
>   they haven't been opened yet and thus still have NULL ->i_verity_info.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good; you can add:

Reviewed-off-by: Theodore Ts'o <tytso@mit.edu>

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
