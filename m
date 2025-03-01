Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8997A4A7CF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Mar 2025 03:03:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toCCX-00024D-OV;
	Sat, 01 Mar 2025 02:03:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1toCCV-000247-TC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 02:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=duBdWCqGMyot/biSupNGUk4zTVbkQMBzCGz559cvv0c=; b=Brvr+Ok6/UkgA4ZkZYxKmhums7
 7D+x3lnx4iYz/Bmtdp2d/vCRAE+RPt59sRV80nKFDO/leiMD378+ENYJHUjBJioE1JILmwvQBSUzv
 pO9k0VkuozFqS77W2ailF8Wc9Z5ZcEg6t+81wmK1/FTf08JAlwYkx4fziHdAbGiTeKdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=duBdWCqGMyot/biSupNGUk4zTVbkQMBzCGz559cvv0c=; b=D2WcgSdX8fPTdNfv2fxZYuLVIC
 EqSM+tbpvMEpgok0HA78inpltfeQhOj1fcX6izDYeFZ2SkxlRAT/lWHuX3hl2lwxknLizA/Jny2TQ
 8EhLMyMc6tiMW8xoT+6dUxun/xzAxvd3LBpPmSyFPUiPLOqOchC4BxR7ikpNn9yC44ps=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toCCV-00009m-Qz for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 02:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=duBdWCqGMyot/biSupNGUk4zTVbkQMBzCGz559cvv0c=; b=hi2q5pdwHzGcYKAJLwGAwJK2F0
 HrGr5pBK+FAvqn/R57WbCCXJE1E7CHP/WkSIupNCUqPHyRb8AFO5MW7ry7mgwgVq4pK15cN2dTL6R
 8Yz66bm3iMyni+x0v0LvozEPOwxoB7mbZFmfair+M///bxJ7eYvhwpAHYiayYKOeQ47w2BgS7Werw
 jGeN/oT7lW6v7QCp2vFZCCQgSnBOCKHc9PGe/9SEhzwLgMuqWOm/8YpytibcSfdkoI+BnpX87N6Jn
 gwUtJjajPv4WqxrnMbCjHfh1GORJXlHJbhsMuK/6JnOmTtLZl7V5rb6qZSTIQmV0Vld27p+dMHYRh
 dqPgkapQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1toCCK-0000000Cn9b-1JUA; Sat, 01 Mar 2025 02:03:24 +0000
Date: Sat, 1 Mar 2025 02:03:24 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Z8Jq7PQNRDu_zmGq@casper.infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-18-willy@infradead.org>
 <39268c84-f514-48b7-92f6-b298d55dfc62@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39268c84-f514-48b7-92f6-b298d55dfc62@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Mar 01, 2025 at 09:15:53AM +0800, Chao Yu wrote: >
 > struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
 > > { > > - return __get_node_page(sbi, nid, NULL, 0); > > + struct [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
X-Headers-End: 1toCCV-00009m-Qz
Subject: Re: [f2fs-dev] [PATCH 17/27] f2fs: Add f2fs_get_node_folio()
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Mar 01, 2025 at 09:15:53AM +0800, Chao Yu wrote:
> >   struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
> >   {
> > -	return __get_node_page(sbi, nid, NULL, 0);
> > +	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0);
> > +
> 
> 	if (IS_ERR(folio))
> 		return ERR_CAST(folio));
> 
> > +	return &folio->page;

No need.  It'll probably generate the saame code (or if not, it'll
generate worse code) and this wrapper function has to be deleted in
the next six to nine months anyway.  We use this idiom extensively.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
