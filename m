Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D239B3EF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 09:32:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lp4JO-0002Rv-0v; Fri, 04 Jun 2021 07:32:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1lp4JJ-0002RV-SX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 07:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=98SIJrqFhBhDUelClzeXX+PxixE36diYKS47LsHePro=; b=REXrRZac2kxrGrZKm56rwm2QC2
 buLyXstU+kEvBobraKpkM09g8vI/XMj5i4iG5FUo4q0P/t0eax03Y/6W+57VawiYtz4Uff/9W/fCK
 66W5LurzEb1Als+vN31d/Uu939H//jjYOFJv1XRyOsCoTZ38Ocmkfe5FP/Dgvb3ecRI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=98SIJrqFhBhDUelClzeXX+PxixE36diYKS47LsHePro=; b=a
 1Z515lnPqFKWqbPGFlL5v9i/afHVQijyjOqaSQcKPP2qv74GI+Cg0kw2XfBCJjIle6OajWPmxvF07
 k+GG4DeM+VBAEv5+p7V3+AXoAWXZny2UGJ8eoTotWutDyTtcMh0Jn/0mxGsojqtD8Px/lD6T3vo4B
 4Zsh1Fx61f//L+k0=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lp4JC-0006nR-8I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 07:32:06 +0000
Received: from SZ11126892 (unknown [58.250.176.229])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 108A3AC00DA;
 Fri,  4 Jun 2021 15:31:52 +0800 (CST)
From: <changfengnan@vivo.com>
To: <jaegeuk@kernel.org>, "'Chao Yu'" <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 4 Jun 2021 15:31:51 +0800
Message-ID: <003001d75913$aff3cc40$0fdb64c0$@vivo.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AddZE60H6vDap88tS+W6q5u3SEOCwg==
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGhpIGlZDTExNSh4YQk5CSx9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Ahw4Iz8RDQs0QxY3TB41
 CTowCyNVSlVKTUlJTEJKQkpJT0NNVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUlISkg3Bg++
X-HM-Tid: 0a79d5ef7ae1b039kuuu108a3ac00da
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lp4JC-0006nR-8I
Subject: [f2fs-dev] f2fs compress performance problem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi:

I've been working on f2fs compression for a while, I'm confused on f2fs
compression performance, after a while reserch, 
I found some problem, maybe need some discuss.
I use AndroBench test performance on mobile, after enable compression, the
benchmark scores have dropped a lot.
Specifically:
1. 32M sequential read has dropped to 50% of original. Test case open file
with O_RDONLY|O_DIRECT, and set POSIX_FADV_RANDOM, the major resaon 
is disable readahed. For now,I didn't found any patch can improve this. 
2. 4K random read has dropped to 40% of original, after merge `f2fs:
compress: add compress_inode to cache compressed blocks`,
significant improvement in random read performance, up to 90% of original,
maybe more.
3. 32M sequential overwrite has dropped to 10% of original, after merge
`f2fs: compress: remove unneeded read when rewrite whole cluster`
up to 30% of original.
4. 4K random read has dropped to 1% of original, yes only 1% of original, I
found  open file with O_WRONLY|O_DSYNC|O_DIRECT is  an important reason, 
every time sync a compress inode need do checkpoint, after I remove
checkpoint on compress inode, up to 10% of original. And I think major
reason of this
is we need read whole cluster and rewrite it ,but I did't think of any
method to improve this.

I want to know is there any idea can help to improve this.
And I want to know do we have goal for the performance of compression, is it
possible to achieve the original performance?

Thanks.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
