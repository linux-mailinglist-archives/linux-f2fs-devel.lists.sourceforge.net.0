Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4EA157C4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2025 20:04:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYre3-0001Q7-N4;
	Fri, 17 Jan 2025 19:04:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tYre0-0001Q0-03
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 19:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1oEuGqAuh5y6McX/JRE5DpfIQdB/lYrzgC5S1T6HyeI=; b=UwRFuJROI0jScQJaJrE5w0Gg83
 NwoM/BXfaGAB3lpaJXhPVx2kfBoCbqxHwcdxQ09Y7Q96vxTHzCLjWaNTUTeR6S6d812uQFCHObPSc
 SblRd4mxSft0DA21De4QnZrQrC5ViNWNPtYsc2eMM+hK1GtUdqabC+proAW31ydtAbYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1oEuGqAuh5y6McX/JRE5DpfIQdB/lYrzgC5S1T6HyeI=; b=HyfUS6Nsr2NS0ieWFmosiJRN4Y
 YvBGeEy8GHeIfZa38uWe6Y0ux9D6cRtdLiTdnlfyOEmJbzb29t54zc8dRxxTN4qELQL8PGvhnxEyl
 TpQ21Rtl+LLcdSrWQtY0ESisJ7F8eFxySpJFD2keEuVCwCiN4560YnodRpj8wP/nW48U=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYrdx-0007U8-KP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Jan 2025 19:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1oEuGqAuh5y6McX/JRE5DpfIQdB/lYrzgC5S1T6HyeI=; b=PSjNg41IoSDdtKxuGIlNZkpgft
 qq1u4qSUKf0a7QOEYJ43Z68BEoSfHVA2IQQnO7+vKngCF6BKpf89lBOnuM2OOWkY9LTe1eWG0Q3PE
 XtIOUTMCpTKEqAATzjnPAcU9GJ5fOZHxeNjpK/G7AuqeK4+XyPGg05wIWFP88Omf5ERnywt7lcuGo
 3vjOOKgYO/9Vs4SdWHX0UTmo5S7TbZU+0wpy5grRWrttglNmoqcycQRmArC0rd9gqYe0VUOQmEtJP
 YVoUvtt19z05XjiDYnZW2yt13BgnxcueNUW0GBbYv1n1TZFjAK2iacdUz7AuzTfBfMxh01LQ1DxW5
 +RHCgeyg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tYrdq-00000001jzm-3Ntm; Fri, 17 Jan 2025 19:04:26 +0000
Date: Fri, 17 Jan 2025 19:04:26 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z4qpurL9YeCHk5v2@casper.infradead.org>
References: <20250117164350.2419840-1-jaegeuk@kernel.org>
 <Z4qb9Pv-mEQZrrXc@casper.infradead.org>
 <Z4qmF2n2pzuHqad_@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4qmF2n2pzuHqad_@google.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 17, 2025 at 06:48:55PM +0000, Jaegeuk Kim wrote:
 > > I don't understand how this is different from MADV_COLD. Please > >
 explain.
 > > MADV_COLD is a vma range, while this is a file range. [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1tYrdx-0007U8-KP
Subject: Re: [f2fs-dev] [PATCH 0/2 v6] add ioctl/sysfs to donate file-backed
 pages
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 17, 2025 at 06:48:55PM +0000, Jaegeuk Kim wrote:
> > I don't understand how this is different from MADV_COLD.  Please
> > explain.
> 
> MADV_COLD is a vma range, while this is a file range. So, it's more close to
> fadvise(POSIX_FADV_DONTNEED) which tries to reclaim the file-backed pages
> at the time when it's called. The idea is to keep the hints only, and try to
> reclaim all later when admin expects system memory pressure soon.

So you're saying you want POSIX_FADV_COLD?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
