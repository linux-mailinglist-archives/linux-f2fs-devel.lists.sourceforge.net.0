Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D70F3F4CAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Aug 2021 16:52:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIBJo-0005bl-1h; Mon, 23 Aug 2021 14:52:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1mIBJn-0005bX-07
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 14:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kZ/8uyp1/oRxUCtI2dwfZuIpSLa1KmDTv6CjiMU0wbo=; b=FB24p6oc1/nG0YO6NieahUdFeD
 Je9XUYqewZVW7oBWNI8kOwu2yuFZMzT1P230M1OmZI2frvvfIEqBi+8G5lSP6ePB9tUGnxGTj1VVw
 oF3BURWvPuOLCcmjieCs+mlLPSyG6S5Ztye7po3DIRPuBnrPf509Gv/vL7rZ9s5QD0xU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kZ/8uyp1/oRxUCtI2dwfZuIpSLa1KmDTv6CjiMU0wbo=; b=O5NnivK2z9dUiJFk6IocfLyOwf
 HGhvj8sQJJekiJn54FjZc+AWK1IknwMG/QQenW5kwda8+Azdd3EfLOsL1lrwWGKwoirOHeVCAm1Om
 Kp8nG46qdtP/xK7lBfCF4+3mCqf3Ij8yCPzC8e9kdof5JvrOucVcbd2hJmZkjAHPoDHA=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIBJm-00FtkD-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Aug 2021 14:52:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 691211F42633
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Christoph Hellwig <hch@lst.de>
Organization: Collabora
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-3-hch@lst.de>
Date: Mon, 23 Aug 2021 10:52:36 -0400
In-Reply-To: <20210818140651.17181-3-hch@lst.de> (Christoph Hellwig's message
 of "Wed, 18 Aug 2021 16:06:42 +0200")
Message-ID: <877dgc2oy3.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Christoph Hellwig <hch@lst.de> writes: > Return the encoding
 table as the return value instead of as an argument, > and don't bother with
 the encoding flags as the caller can handle that > trivially. > >
 Signed-off-by: Christoph Hellwig <h [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1mIBJm-00FtkD-Bp
Subject: Re: [f2fs-dev] [PATCH 02/11] f2fs: simplify f2fs_sb_read_encoding
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christoph Hellwig <hch@lst.de> writes:

> Return the encoding table as the return value instead of as an argument,
> and don't bother with the encoding flags as the caller can handle that
> trivially.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good:

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
