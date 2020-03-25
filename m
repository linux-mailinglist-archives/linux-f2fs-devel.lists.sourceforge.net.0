Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04383192C15
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 16:18:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH7nk-0004mZ-Ly; Wed, 25 Mar 2020 15:18:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1jH7ni-0004mP-OW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wI2iEhqXH5FunWtdKhJ1mMQW5BBNtoO0FFpOPXy3Ip4=; b=DimtcOv+n/AOK5S1aaeR7WEpxk
 wZsyXeEEf16S/Ivc2s1anbkAP58hlstKUBUnJVqA/PxHibfGoqnqb6f0AqDiy4tj6NBIaGN92w+ha
 DZpTdHzyZ4W4GIBUQAGZYWKu+HS5iXw5eDukilXc6OAahrsrchpRA/AS8RCCrkKsT+zg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wI2iEhqXH5FunWtdKhJ1mMQW5BBNtoO0FFpOPXy3Ip4=; b=b4f+eXe6QfUMYo3ZT1nK4SOJVu
 5yM7bivetO+3/QnMUlYTL3cEeHfNLLvq/W7YDD2WfUsOeoboN+/1oAovO79KeWtM1yPltxfU2SdOG
 27RFT8rzk/82RxkrxCCJq9OVWCF+jN639RuelvxximpNX3mQsdgDtIv1TicSsElEP9aw=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH7ng-006ka0-QE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:18:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6EDE168B05; Wed, 25 Mar 2020 16:01:08 +0100 (CET)
Date: Wed, 25 Mar 2020 16:01:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-xfs@vger.kernel.org
Message-ID: <20200325150108.GA14435@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
 <20200325122825.1086872-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325122825.1086872-3-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [213.95.11.211 listed in list.dnswl.org]
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH7ng-006ka0-QE
Subject: Re: [f2fs-dev] [PATCH 2/4] fs: avoid double-writing the inode on a
 lazytime expiration
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Mar 25, 2020 at 01:28:23PM +0100, Christoph Hellwig wrote:
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1448,6 +1448,11 @@ static struct dquot **ext4_get_dquots(struct inode *inode)
>  	return EXT4_I(inode)->i_dquot;
>  }
>  
> +static void ext4_lazytime_expired(struct inode *inode)
> +{
> +	return ext4_dirty_inode(inode, I_DIRTY_SYNC);
> +}

FYI: this is inside an #ifdef CONFIG_QUOTA, so I'll have to respin even
if the overall approach looks good.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
