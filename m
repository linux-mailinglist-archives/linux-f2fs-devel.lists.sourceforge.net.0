Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A21712D1000
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 13:04:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmFFX-0003ez-Ah; Mon, 07 Dec 2020 12:04:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1kmFFV-0003es-Ue
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 12:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2WreHtfpJx8b7ut2qXQWDVVC2cIIy4C91dP/dxhw2Nw=; b=QtQVChoeE7mYoIsN8dk/iaL5Tm
 9xcbmsiZoF6q8L1g5x1Lsmg6EA0B0YAAheDFvbQDUuHNv1NGNKY13rXBXP6LlcqBZkVETR47eBZCQ
 UV5m0qb7YLMlNf+XqASfGG2A8EwSR2mKnZTFBINu98xyJxDu4AO2mNDbORwXGR/6mSQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2WreHtfpJx8b7ut2qXQWDVVC2cIIy4C91dP/dxhw2Nw=; b=X55EqkRbSbfS15YblkUGrzvWgB
 2U8I7G4XlGrp3Q9uBY/ZHo18Fg78WQ3VU1xUhEz1Ym9GBcDd7dt3N5ZhB4auvD+YZClOKLv2g0z98
 TPrDYNeP6YaiDM+qMMx04Xr4L76NEYdcisYuEYoH3lrmubvCr+nmZbnVR85oVqKqLHOE=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmFFI-001vs8-NT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 12:04:13 +0000
Received: from localhost (unknown [IPv6:2804:14c:132:242d::1001])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: krisman)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C15CF1F44F9F;
 Mon,  7 Dec 2020 12:03:53 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20201204233940.52144-1-ebiggers@kernel.org>
Date: Mon, 07 Dec 2020 07:03:47 -0500
In-Reply-To: <20201204233940.52144-1-ebiggers@kernel.org> (Eric Biggers's
 message of "Fri, 4 Dec 2020 15:39:40 -0800")
Message-ID: <87v9dd7rh8.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1kmFFI-001vs8-NT
Subject: Re: [f2fs-dev] [PATCH] libfs: unexport generic_ci_d_compare() and
 generic_ci_d_hash()
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
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> From: Eric Biggers <ebiggers@google.com>
>
> Now that generic_set_encrypted_ci_d_ops() has been added and ext4 and
> f2fs are using it, it's no longer necessary to export
> generic_ci_d_compare() and generic_ci_d_hash() to filesystems.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>


-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
