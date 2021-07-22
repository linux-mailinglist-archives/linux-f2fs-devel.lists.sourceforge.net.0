Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FA3D257B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 16:16:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6ZUr-0005Fr-95; Thu, 22 Jul 2021 14:16:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <greg@kroah.com>) id 1m6ZUp-0005FX-RC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 14:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=prWACrJFXo8y1jrEMMR+3UsGDvFjhhPhic6EAg8Shu8=; b=lJjP/Hg83zZUUvPheBGtUHcGVn
 DJZUEMzUJNuumtQ01ITwEiEWtZgjoYX8sntiK0Odm49gxMqD927jNxUHDO+2ZwHAxjCT0y0Slz1J0
 h/8X54lurEQdOAE2YH7VSNOeDYkljDOcRx9xnHNyh2xe5QXe5B3k/XDwmD8TAbeF8MvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=prWACrJFXo8y1jrEMMR+3UsGDvFjhhPhic6EAg8Shu8=; b=IQGxQorSfvjtof44XkZ1A23FXO
 T43Qh4Awh1g0616dbD9QU7WLxVdDB/G5DEp4Y8Pb+hRU4zchbF8sEFQ70CraotXuQHubbwJJMI7r8
 OQlxnXFwmf8VFcq0prMLy3wmqfBNZA1cM+5H3lzEsQ61SnOdi6W3ZwVs16zUpGqDxpbI=;
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6ZUb-0002lB-LY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 14:16:19 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 414BF2B011FE;
 Thu, 22 Jul 2021 10:07:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Jul 2021 10:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=prWACrJFXo8y1jrEMMR+3UsGDvF
 jhhPhic6EAg8Shu8=; b=Aovg0XThHHqMgm5dfHwW8LWv/TBQCp732ZkT7NbUDqM
 vZFy5tM/TQ6gAkqK9TjecDrsFtA+qg5bdsvCO5esupgoJpMlC8UQMJEf4+D709jU
 BC64Z/qwUmOmMQ9HmAA/sEkqT+v0hlkkM4wemYGNGsXskLd0HNps3QpxE3331OS6
 Dayh0YpFWywsIa2BBtR5USXj/W5QzgxBwiV22OsZIExoVg0OrMPgHRgo/oBmOcIr
 92LdmWpQE7RhXcGGHybreEKMyh2Tqm51BVD9ws4YI1sNhCqlQd+9tD4Ly3MBJdn/
 OMah87GFIavl3JI2cwN1m9MVhlUL6xQUFQQPbXFhWjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=prWACr
 JFXo8y1jrEMMR+3UsGDvFjhhPhic6EAg8Shu8=; b=IXn7WMQOI/JBPvPwCdFYdY
 OEmfUIWXOngyh/3b2yMQNNWkJgqsTupy3T01T82FclshPj66S2WqX9A3MmGj9arP
 FkO0xZZBFDMoWWU7kMal7B/QbWVcsN8Q26PUd0VbhTk5TJSs+K/FBSgkj0Z2WEnP
 NqhvDD+Km/cy0HorPsDa4lx1EalPJwtnNYelbqqjjG1jN9ea+sxYghnv+TPCLG8N
 kS9Em7A+SjE9sQv0pxr8oFCjRjyMcAJAicQ9CZwzS1k5qnaPc39hisZbAQDCPU64
 UVJwNswtau/srA+JW6YK0bpAbfs9OOpjotcRSmrj9NEz7KHt24u/TPRONxtmCESA
 ==
X-ME-Sender: <xms:hXv5YPr8ejODVQfwyTP1Q0ZvV-msDwaAMvtQzOiUHETQREI_gGgCMQ>
 <xme:hXv5YJpuFLUiZactFUJeoPEb8XUUmxtqmHRVdZRrIG7pDv4GeXaoXBTUqQ4aL-6DN
 PM3HpjNFavTdA>
X-ME-Received: <xmr:hXv5YMPLae4ylaJK7pHe7LtGHTzMkTxNDOXzSwwgoXJyYSWbWFcCDrdwOSoBy2dD8zr9d-OYrq-w_IFKmZQzgWVuVurZsJ6x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
 ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
 gtohhm
X-ME-Proxy: <xmx:hXv5YC5gxMai7SJx2LLToP0et-M-MNfz5bsMd2Qi5qc2KGt_ohbThA>
 <xmx:hXv5YO4LstqeDol9Z3otPxNxuBznrHzf4tAYhcsjZrUdRvhmyFZB-Q>
 <xmx:hXv5YKiE1fi-Rj3AMB91OFr5c5nyiBg6bfhQs5TJrzFb9T2gckUKvg>
 <xmx:hnv5YLx1iyMOtKHIErRZzh5topAIJWMtT0rLyOCJYJx6td_buemKpriqX9o>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 10:07:01 -0400 (EDT)
Date: Thu, 22 Jul 2021 16:06:59 +0200
From: Greg KH <greg@kroah.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YPl7g2Gpec2Lh3a6@kroah.com>
References: <20210720161709.1919109-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210720161709.1919109-1-ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6ZUb-0002lB-LY
Subject: Re: [f2fs-dev] [PATCH 5.4] f2fs: Show casefolding support only when
 supported
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 20, 2021 at 09:17:09AM -0700, Eric Biggers wrote:
> From: Daniel Rosenberg <drosen@google.com>
> 
> commit 39307f8ee3539478c28e71b4909b5b028cce14b1 upstream.
> [Please apply to 5.4-stable.]
> 
> The casefolding feature is only supported when CONFIG_UNICODE is set.
> This modifies the feature list f2fs presents under sysfs accordingly.
> 
> Fixes: 5aba54302a46 ("f2fs: include charset encoding information in the superblock")
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/sysfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
