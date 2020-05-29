Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7591E88E1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2020 22:28:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jelbt-000268-Hx; Fri, 29 May 2020 20:28:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jelbr-000260-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 20:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zPMXHGinvpmbOO2uHJoJ8DYwUQB9G7uW/4dEVS7cJ0I=; b=Iv74mQUomN0IkPJO9RaqRa/Pvy
 2bkjla8BQS6uDLrKnrJFt9KW6ojRjwFha0zgcbydL2JNmVwHTjkDPvZjPTYeJRQ9IuBx8WZbEt2ji
 YD8rP+wseIQRDjFKydyf94xJC6SNIgvvXgo/LsJjLriizyH/jMhw1gABNZwevbngDv54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zPMXHGinvpmbOO2uHJoJ8DYwUQB9G7uW/4dEVS7cJ0I=; b=Tf2n1847PIc/HcbZyr/5eWOhca
 EWTTN6vAoImx8sgjmbObAebvVD/iPNvUG1BpW2Rhu3Avyn0ZEDRnuCAGVXE0zkfovc0XGor3CxxND
 A9QIJ6SAcn1WI7o3Q0gm2JJQNZL7jZ089tjXmaBVvg9IgCoDWUV0nJfS4Wu7Cm4zQDgs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jelbk-0008Fn-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 20:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zPMXHGinvpmbOO2uHJoJ8DYwUQB9G7uW/4dEVS7cJ0I=; b=XqOxZivMEezkHFFqWL9Ubo1yCp
 jYuOb6sadXa65JFn7RehjWvI6opK1yjZQNHP+FDKbzLYVhzNUNA0D7wftRwkHW+pgbPcxnB0sEqaL
 sJhErbLN7ury7gOpdmM/R/bMc1mCd5cQQnOMfSMcdISKzShPzjyGTcZUh+Ep89jaovMmp1tWEn9ct
 kRirdyfCQoBe/cDzS1Xc/MQRw4h5hxdPUopYIEJ0glXskivBMitIDKEJj39t9CkkbIZdGp+f9dJXh
 +2HTf7n8uxWwyxrZuZN981ukwk2fuHPhi1ap6J+VubHIq6FfJrVSsQf4pMRUdII6H59MXDlDUQOJd
 a14fe67A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jelaz-0008Ci-I1; Fri, 29 May 2020 20:27:13 +0000
Date: Fri, 29 May 2020 13:27:13 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Kaitao Cheng <pilgrimtao@gmail.com>
Message-ID: <20200529202713.GC19604@bombadil.infradead.org>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529141100.37519-1-pilgrimtao@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jelbk-0008Fn-Uy
Subject: Re: [f2fs-dev] [PATCH v2] blkdev: Replace blksize_bits() with
 ilog2()
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
Cc: hoeppner@linux.ibm.com, heiko.carstens@de.ibm.com,
 linux-nvme@lists.infradead.org, dhowells@redhat.com, clm@fb.com,
 deepa.kernel@gmail.com, houtao1@huawei.com, hch@lst.de,
 linux-s390@vger.kernel.org, bvanassche@acm.org, darrick.wong@oracle.com,
 mark@fasheh.com, satyat@google.com, hch@infradead.org, borntraeger@de.ibm.com,
 gor@linux.ibm.com, chaitanya.kulkarni@wdc.com, josef@toxicpanda.com,
 ming.lei@redhat.com, viro@zeniv.linux.org.uk, songmuchun@bytedance.com,
 dsterba@suse.com, jaegeuk@kernel.org, jlbec@evilplan.org, sagi@grimberg.me,
 axboe@kernel.dk, balbi@kernel.org, damien.lemoal@wdc.com,
 martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, asml.silence@gmail.com,
 linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 29, 2020 at 10:11:00PM +0800, Kaitao Cheng wrote:
> There is a function named ilog2() exist which can replace blksize.
> The generated code will be shorter and more efficient on some
> architecture, such as arm64. And ilog2() can be optimized according
> to different architecture.

We'd get the same benefit from a smaller patch with just:

--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1502,15 +1502,9 @@ static inline int blk_rq_aligned(struct request_queue *q, unsigned long addr,
 	return !(addr & alignment) && !(len & alignment);
 }
 
-/* assumes size > 256 */
 static inline unsigned int blksize_bits(unsigned int size)
 {
-	unsigned int bits = 8;
-	do {
-		bits++;
-		size >>= 1;
-	} while (size > 256);
-	return bits;
+	return ilog2(size);
 }
 
 static inline unsigned int block_size(struct block_device *bdev)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
