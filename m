Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DC667F72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 20:43:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pG3Td-0002QP-H1;
	Thu, 12 Jan 2023 19:43:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pc@cjr.nz>) id 1pG3Tb-0002QE-Um
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 19:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I2YK0KStoZilkvt5Gd+Z0QXSKrgiOl1UdETNcSgpEpE=; b=B8Cq94+8kjGUgXhRCuxQG7wj2c
 sKcvmeyIGfU4GpZK7dZ875lh88msWgRCrTRl6hqEn2EbMCGwP1Vz3n+SH1j/99bR+NqgH7RWdkpu8
 ld4vEYEt5c5a3Dff2yAF6M8NMxIJEjnnP9NhWnPCcP4gLPT6k6CCvGvXUsDC/tRwVMYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I2YK0KStoZilkvt5Gd+Z0QXSKrgiOl1UdETNcSgpEpE=; b=QSv6x9SZG+tJDIogemDI8HXdOu
 fDOy0iBVJew/c2GUKljYytvCIO4rI4JhrCs01j4HpPwkmEaIbGDgiWSMVl2lWf5PD6fazqmAVN8+L
 8XVpM160Q28XOJHzl63kyGUeVHkw3nyJzKgi2lbuUnfcnESZYkTk3tN3M6RKhn8o4Tb4=;
Received: from mx.cjr.nz ([51.158.111.142])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pG3TX-0001Cm-SW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 19:43:02 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id D0E2A7FCE1;
 Thu, 12 Jan 2023 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1673551439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I2YK0KStoZilkvt5Gd+Z0QXSKrgiOl1UdETNcSgpEpE=;
 b=i+65F8jlt9SrxFye0Gw20zt6UKpTEaqiZQ5hMVqSu0k7iplUUCLaWGe7MPjLIcUXvR2Ze2
 EPZvayy3ujt17G7U6k4N9U3mDmbAViZrJRkdIjJ30e2YmzNFL9kFY3KN4OmLssXkKylqmj
 E8tOKo4JSk3JfhG8aJ26Wc/wDEh7vUicPsX8QXZqm+7WwOK9nS0qxN7D/+flVsxas11Fth
 oU/iflnYw8+Gm87I9cBkOHMwnYst1u7763QKPIvahJlVCd3cUAf31rG9cwxkdB+Sbii/p1
 NDe89irKrvEmsmtdfYfdlUgHuTnNrT2Ps2o/IkqPzfauQjAjCU8/6VVNF8HXCA==
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
In-Reply-To: <20230104211448.4804-10-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-10-vishal.moola@gmail.com>
Date: Thu, 12 Jan 2023 16:23:54 -0300
Message-ID: <87ilhb36b9.fsf@cjr.nz>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  "Vishal Moola (Oracle)" <vishal.moola@gmail.com> writes: >
 This is in preparation for the removal of find_get_pages_range_tag(). Now
 also > supports the use of large folios. > > Since tofind might be larger
 than the max number of folios in a > folio_batch ( [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: cjr.nz]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pG3TX-0001Cm-SW
Subject: Re: [f2fs-dev] [PATCH v5 09/23] cifs: Convert
 wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
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
From: Paulo Alcantara via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

"Vishal Moola (Oracle)" <vishal.moola@gmail.com> writes:

> This is in preparation for the removal of find_get_pages_range_tag(). Now also
> supports the use of large folios.
>
> Since tofind might be larger than the max number of folios in a
> folio_batch (15), we loop through filling in wdata->pages pulling more
> batches until we either reach tofind pages or run out of folios.
>
> This function may not return all pages in the last found folio before
> tofind pages are reached.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/cifs/file.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)

Looks good.

Acked-by: Paulo Alcantara (SUSE) <pc@cjr.nz>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
