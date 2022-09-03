Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A75AC022
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oUX6J-0004q7-Q5;
	Sat, 03 Sep 2022 17:38:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1oUX65-0004pV-Na
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z1VGvcyPcxaVL7OhRrzeu9KO4THMsdUZs/+YFm2RijY=; b=am/WesFwMghghljxl9fCWWXlVR
 QQpoxhq0wzMVgA9qBDmscltbc9rNcRgFdFmmyGe5zTsvqdJwvhsZ8qjQCRwPslgTJipFqwzPtpAB/
 +DIBJHDL+42j9dfNUxYdLyKIHKZbm//vo08pMxYgjaBcK3X1c2XHqos4ifGDYaNbcXks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z1VGvcyPcxaVL7OhRrzeu9KO4THMsdUZs/+YFm2RijY=; b=L8uqiZyg6wJjQrUC/LfYdm+blI
 p2GXxUD2Mb+Xhd2bnQVtpwIdc+n9JExwCXE9aKZx6hnuEDMxDB1ig7taAqqnaYV41J4DUzPBcHGnX
 XxTEIuwVkMlMF+0pypDwsea/z0zf4uIeq//FimOJfWg0BbP9ZPxJvd1uKHssasvIWhfA=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oUX61-00CdUD-Am for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Sep 2022 17:38:21 +0000
Received: by mail-lf1-f43.google.com with SMTP id bt10so7602574lfb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Sep 2022 10:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Z1VGvcyPcxaVL7OhRrzeu9KO4THMsdUZs/+YFm2RijY=;
 b=g2fHdxzAoAeKP5KVAxV0TRt4CMGPzwaKPOq9K1H43TxNUN7qx6e0EdQEhdSUX0KIc/
 PpkV40H2pdOzFZnrqtKl4asBbiyXnCA0QTU2nPuVzDQwe0jpO9Mw2gtRAlz9nkilCH3H
 LBi0okNtFk16pYaBWEvWGrtSqewJMJW6wgbC1J0MUYzwS7ZvZ/2k7Q4lrL9SnMad9f76
 UEkIZPl1ryQa14KkcuS1lcJNfw0IHIDy+p5smTJlhOf/snvD8ouqd53byOlS4Cq1iDaw
 bQ5BJS9c/ErnJpwhjKL4/aBwe6A1eIEcPPtQjNzPIchP1ouZInif6Qgxq7x1Z77qSIBE
 rEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Z1VGvcyPcxaVL7OhRrzeu9KO4THMsdUZs/+YFm2RijY=;
 b=DXWnYlFoGqc/pOUTorW17G9iXjaRoBlXIAjLuDaEAsTAJFjjxsLCOUfB99KdQKQqCQ
 PJ4vLa94FdJWGPt3BD2h9gc03X31/HsjCXNROParEvUXgfNu5unzxCkwPsQtDj9AIEZz
 k/DtxMAgunoiExOe1vvsKE4JlpBQi9VDemTby5paBoJ4OekT6zoQ8/q9IF0mrRO+8JMv
 D32jPlJsofcpjXCfBGIz6c8YHMzpYfWTZodOMIJLdvcYlWTDvUcXvgLAUEw76TcBjx7d
 lEN7Va1okLsQaKXk51TTzoV8KEWxbvR8EwkCrVqyobbQVbJ8sfdMjwLfdy4YsmYzwW4P
 H7bQ==
X-Gm-Message-State: ACgBeo0TEnJ9sFCqrrTDLGPdhJyMxwAwzrT6yXrGLp5nWU7hUrir9L+J
 hK1Nebhl0kVEzTarYJtq1Lwyatv0EI+L9RV0maI=
X-Google-Smtp-Source: AA6agR4lrNoGuI5rw96XeRPams7GLmC/xZVLf7HmyQGlHcfkfepnxT7a1h01PJ6LedVQXetRHT81hCJoOKKkAxZqFXI=
X-Received: by 2002:a05:6512:1395:b0:48d:81b:4955 with SMTP id
 p21-20020a056512139500b0048d081b4955mr13309674lfa.307.1662226690740; Sat, 03
 Sep 2022 10:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-22-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-22-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:37:53 +0900
Message-ID: <CAKFNMok9qtqHkHzCGW2jckej3ZO47dvU2x+EQ1mJNwVHFHuzvw@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 2, 2022 at 7:18 AM Vishal Moola (Oracle) wrote:
 > > Convert function to use folios throughout. This is in preparation for
 > the removal of find_get_pages_range_tag(). > > Signed-off-by: Vi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.43 listed in list.dnswl.org]
X-Headers-End: 1oUX61-00CdUD-Am
Subject: Re: [f2fs-dev] [PATCH 21/23] nilfs2: Convert
 nilfs_copy_dirty_pages() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 2, 2022 at 7:18 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/page.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
