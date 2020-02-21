Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE291684FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 18:31:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5C9A-0005GZ-EZ; Fri, 21 Feb 2020 17:31:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b8b070cac54c30a96dd5+6025+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j5C98-0005GQ-Ia
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDx3LdN9kmcpyyosCuGFps+kdXETL/vBLPKf49LLrtA=; b=Z5htg+PlCRx8UbLQ12fUtUDEB6
 UwTCAIBNoVdDRC3NIzMPO4FNvhZX+7wAboQjThJP2O5Y59UBvJPcwgFRZn0AFK+tEwuYcAR9Bc8hp
 hJ8h2LJjcZ7IZNgXf48fBcLRNX8IJv60FqaSetqN3WIuw8rpHCwvOEIn7Lm1L9c+9PYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDx3LdN9kmcpyyosCuGFps+kdXETL/vBLPKf49LLrtA=; b=Th8RF3e692pgjyaHzh0/Ftz/4G
 qv9AIiFtVHSuUbaroKgHR579qz/zJoA5SW/5IILJ2oMspisx+TG/dlrXK6b4j9tR3fjhBVvizlzTf
 +JyiWMfSscM7lMcG/ozGnXgS2dA7IsA0Ba3SiP3AdklLqDGh1nK36H5X0CCcAJhSoiuU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5C97-0095vS-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pDx3LdN9kmcpyyosCuGFps+kdXETL/vBLPKf49LLrtA=; b=WC40/Nnwv876skL3b390tcpGP9
 HgE+oXYuSaMQgz5W07wW6Rr47DqxNlyAwrKb3/uPmOsWKnNnVtYE8Xz8DSZGJ3C99Qd3sG6xfF9Ii
 XuBMvXiTK1amcjIiiq2kC4rs8ffrhGi/JO8Nwy+/88DvBOdifqDnueyctDpfPXJkr2EnAO3y6bwzj
 3Y/4M719cDTpkqdmkX6WdGI/x1/3C/oubQQKuEl2mpHoXbl/1syPu+YXJIUiGA/PikgQ4hmyESHN5
 9PXCOS8FkY3cPGe3AZJ4n/D8zsxqyOfQG7Y2RkV342MYTYvMNg5nastL2NES3sKMkOr41xuj8BRQJ
 POSqE2XA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5C90-0001Qd-83; Fri, 21 Feb 2020 17:31:18 +0000
Date: Fri, 21 Feb 2020 09:31:18 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221173118.GA30670@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-2-satyat@google.com>
 <20200221170434.GA438@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221170434.GA438@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5C97-0095vS-Cy
Subject: Re: [f2fs-dev] [PATCH v7 1/9] block: Keyslot Manager for Inline
 Encryption
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 09:04:34AM -0800, Christoph Hellwig wrote:
> Given that blk_ksm_get_slot_for_key returns a signed keyslot that
> can return errors, and the only callers stores it in a signed variable
> I think this function should take a signed slot as well, and the check
> for a non-negative slot should be moved here from the only caller.

Actually looking over the code again I think it might be better to
return only the error code (and that might actually be a blk_status_t),
and then use an argument to return a pointer to the actual struct
keyslot.  That gives us much easier to understand code and better
type safety.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
