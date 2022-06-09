Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B473654432D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jun 2022 07:33:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzAnQ-0000nr-6W; Thu, 09 Jun 2022 05:33:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <songmuchun@bytedance.com>) id 1nzAnO-0000nk-NP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jun 2022 05:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=; b=YWyKHt1rJzyrnL8RJt/gCDhoBX
 bOCtA1odmNLnQVCDzm15gocTmBIfChHwORmrCpFkr4mxnZlkcR6QGvdAjAKFUUd2wn6rNUGdrLdVg
 rNHpAXGA3m9LBQzWX1xpB3fLAntA2H9WeCMwl/nKa4vcKpJi2n3VtLAv4xlpc2Nmb3ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=; b=a1o38KmXf7tHeR9wl7DWcNMlYj
 XH+JUPRzzWu0XdSKQNHyfQq6MUXP4zEB5ovRIFEoBiVHD97WOzYmE/CCAamGL2y5GxV14R9vN7yto
 DRMYKMv36Z/KjyAIfAWUNK0/IVxzNEPyTjDE+uCN1PPqehP56++wmKXmpbw7W73HgVQU=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nzAnI-0002Q3-P3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jun 2022 05:33:25 +0000
Received: by mail-pj1-f49.google.com with SMTP id a10so20448927pju.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jun 2022 22:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=;
 b=RQ0R70N1jS16HKNC0Ol/Snkv+fFPQxMu+sR7KyTPcd0AtJQdfRDJChe//d33ePjW42
 NUwM+6AWLf4HFFg8nnACUzLphwGwod4E04VS00IvvGGhoglI/uAdn0OmVESO9k7YbA87
 WXoB0WPSZJwIZQYNTDVCrIBlg3nJFEaNR0URvRoZ6V+qEZfc2gJFc0HlrIL1W1WW+rDF
 1/Yc7ng+dbkR+XlDUC9pFMzh9gCVKqODsRZejDoKKLodOa0wkJ1V/grBLEapqp/wFCIH
 /I5BMumfmT4H9nCNsQOMZJKoI5zjOM9KkgLVSCyM7AwYZxsmplXtAzqYRAkSkI1RVqcd
 8nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2koJarmzmGedHyxAL/i+lFQdd0Q5ZAFYaE5poQNe8+A=;
 b=PnNF2GGaJf8Cns9s1saBIfWsMXyuUj9ruwM2av+nJqjyrMnHx9lJssofTrsMM12p4G
 r6NNxEciAXUZ3lDZTCg03r9DpUYi97Orq8NQ/KyYiIWt+CvCoaXexzP099LnYoUCpffV
 HIDnyJFdQXDynd8SB2gGOkVHAmUD8h6TfQVsf6b2gBZjXJ/47XDm6QPWeZTfelndXI1z
 YEe1HYt/ba3P/a/Rso0CHP8Fu9p6ez7me1ZNFKdafsXQy22wu+jGdCB0UGYHGl5+FpUg
 k/3JtsxlvG3BbiV0qLF5zV8XY0iwGWvmyzWmBlYn8WdGeZY/gqoO8C44rfeZVycEd0iv
 rIrQ==
X-Gm-Message-State: AOAM531YGy0G3lIXrMzeQMl6O9ppE4xT+nFJ8cANzPUvGCllBkBsAL+k
 Kqc9qIuURFXsYH1cqo8thjGeerJjedwh69jg
X-Google-Smtp-Source: ABdhPJz3/PMx3RZgt3QHHTiA/K9+ZXI01CeV4NC4DLpNFuQQZTFyqHCu1obpFa9lx3Ct5QRSUsQXvQ==
X-Received: by 2002:a17:902:e748:b0:164:1b1e:28fe with SMTP id
 p8-20020a170902e74800b001641b1e28femr38251973plf.116.1654746785210; 
 Wed, 08 Jun 2022 20:53:05 -0700 (PDT)
Received: from localhost ([139.177.225.238]) by smtp.gmail.com with ESMTPSA id
 a20-20020a170902b59400b001664ce47e11sm12584649pls.210.2022.06.08.20.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 20:53:04 -0700 (PDT)
Date: Thu, 9 Jun 2022 11:53:00 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <YqFunLBBKbZN9uD9@FVFYT0MHHV2J>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-17-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-17-willy@infradead.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 04:02:46PM +0100,
 Matthew Wilcox (Oracle)
 wrote: > This involves converting migrate_huge_page_move_mapping(). We also
 need a > folio variant of hugetlb_set_page_subpool(), but [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nzAnI-0002Q3-P3
Subject: Re: [f2fs-dev] [PATCH v2 16/19] hugetlb: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 08, 2022 at 04:02:46PM +0100, Matthew Wilcox (Oracle) wrote:
> This involves converting migrate_huge_page_move_mapping().  We also need a
> folio variant of hugetlb_set_page_subpool(), but that's for a later patch.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Muchun Song <songmuchun@bytedance.com>

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
