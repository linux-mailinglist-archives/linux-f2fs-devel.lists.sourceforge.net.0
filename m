Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB264929C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 06:55:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4FIs-00060N-Su;
	Sun, 11 Dec 2022 05:55:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4FIr-00060H-91
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 05:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E3iH//lN9j/DlSYhxZrL2nzU/x07WF0rbkFjVtSy4qo=; b=Z3knPgzGhCLfmenqmuB4abjYeJ
 g8n3eEFLcUFGcQpt8vSSINPbzzd8zpidfPZE3vWMltxQVntMfqTqpH7cnhHbLU732lOTt0Fa2qqLK
 gffYwQEOGNiBxDpQkH+R2UEb9cxGk1PfozRa5EESKLRPgovmCYXaN8PTgCcYyy6m7Yfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E3iH//lN9j/DlSYhxZrL2nzU/x07WF0rbkFjVtSy4qo=; b=HpnLp7ZyDYAn4sT4eVdQMvWA7P
 5PaIm8+VVcVAMkk13XjSTZ61yva/ynsl2+GFOCOIpwUdxCTF8gEbjO3iurAKPqsowyql9K3eoKp/x
 y2ANPBBNumSastp1REK1NxrFG3HoGrZBu9GfCh+NYET1vIzMtmVkHuuK8F6P1dZ8vGrk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4FIp-00DXoq-90 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 05:55:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF276B80945;
 Sun, 11 Dec 2022 05:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD88EC433EF;
 Sun, 11 Dec 2022 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670738094;
 bh=1FZSvg1VV5fd0X4IXRQ/3Im/8nHJEAEA/6Sohp7gUlQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uAyt4p6s8439vGHDMi+wDqrs/UBniW407/oGUr/VlX4oqYU3iycP0srZfI3sWJrAk
 oofuNsR7Elnf0oZ8BKt0dS8axjhtZvJ0j6tiES7ahWt8kev9t3inWkARx2/K9nG7cI
 k6FKY9tE8hDPlm49a8f0N4xqTeHWaPvHHYzjzjelrk8tw1BRP0HcAY7IfZQqjqjOx5
 NqFxpgU19OcEQb5mNonszOHGo3VC3rR1Z5N6Mkl35bDxXd3J+6JjocaYz71guctbAq
 fWZGh8HuNf8SsH1AjBSLmBvZRFHFPCOiOsvCp82IrSyo8IkRQpwaC4Usy+UVYMCA/E
 BZsWe7ADG/bzw==
Message-ID: <38c34b59-bf57-4eb8-b74b-8b387b792cb8@kernel.org>
Date: Sun, 11 Dec 2022 13:54:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221102161031.5820-16-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221102161031.5820-16-vishal.moola@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/3 0:10, Vishal Moola (Oracle) wrote: > Convert
 to use a folio_batch instead of pagevec. This is in preparation for > the
 removal of find_get_pages_range_tag(). > > Signed-off-by: Vishal Moo [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4FIp-00DXoq-90
Subject: Re: [f2fs-dev] [PATCH v4 15/23] f2fs: Convert last_fsync_dnode() to
 use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/3 0:10, Vishal Moola (Oracle) wrote:
> Convert to use a folio_batch instead of pagevec. This is in preparation for
> the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
