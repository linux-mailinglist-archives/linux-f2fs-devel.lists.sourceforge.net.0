Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 715FF5B64F3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 03:11:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXuRz-0000FW-Bc;
	Tue, 13 Sep 2022 01:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <konishi.ryusuke@gmail.com>) id 1oXuQh-0000EM-UB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 01:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/XsoyqrT3QB1JAOnynnNk+cD1xAIdvUlxSJ4ed6XIdU=; b=YdN0ZqFWIAcEpjE5OT8UTx8eoa
 TeeTlowMh1yhsVpgcmUPM60mdT18KJ/Mk4C2s24sqayUmpnBd7GHMbctDP0jrMRXfiFRxsxzkIJZ9
 meHEDbY7ZVmTqbfkUlLVMdEUqlZC977I9ou7jLUD8cb8q5tJxHwy2ByQW9XEsiiWlYcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/XsoyqrT3QB1JAOnynnNk+cD1xAIdvUlxSJ4ed6XIdU=; b=eX52ufOk4CakJMUgQvr0CSFzqv
 mC+nb0J6MoqWkPvdIDhQZ8/7Mt7LTmo68Ua/OGhu3+QXmRV7P2DGPXJjKMnrNHkxFbbxfbyGuKekD
 Myc7qooiLt8IELT0nIpKbZ8bqWHnRZxBveXbAYR374mWkfqHzNGA8qfb8Y6oZLDyfgt4=;
Received: from mail-vs1-f45.google.com ([209.85.217.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXuQd-006PUW-Gp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 01:09:35 +0000
Received: by mail-vs1-f45.google.com with SMTP id o123so10835392vsc.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 18:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=/XsoyqrT3QB1JAOnynnNk+cD1xAIdvUlxSJ4ed6XIdU=;
 b=LCh/26aAbGHkKGewKjn73gLlX++zCf8OLBwVxFWLa64tYPDq/i2er1PmrVmMkGAwOI
 L2JRUzDqv2lK9NaVniFYm7FpYuNBfqGBIhKFyEiUvFh3AU/Pe1+xUEezdDuC7oEtVTzK
 z4RnpgRLFEs/kpx/XTpDhcz1YZja3m4TBuvwqk20rCqQfNxg0OTn6cKh89klQ8JdP/d5
 mnV6dtRYDuEjIzD+gV8Sy+Z00atObjJcdT1rQhqSoQ9ZBHA1slMzLmqb42wvp3Fbbjrj
 PcbYe5zgwlygD5zetriqBhKy83A9Y3Tj1nqXRBKeJ829uuOZ6L5Y1UNj+nuZ18uhaFr1
 0FCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/XsoyqrT3QB1JAOnynnNk+cD1xAIdvUlxSJ4ed6XIdU=;
 b=A1v2n+v/J/t2DZpVRgTmrR9+lbygkIccPk58WqifcYdOnbrmKesT88UHonVlyh/t8/
 nlRJMPZFDN4+TTa2OQAdkYZWhswzyzJsSm0QEY0fc8Eo1i+wFzqmo7Dck6BXQLN+7jQH
 FXNr1DC0mcYrRsOO2qPDBfXsOePh8dd0jRoAO0I8gMyOHnFJn4Kxdn6nNz+iS7KsFlwp
 Q7zItac+1Mt/Fg8gL/yP6aEQwyPjjweQc95qzccGEeShd69cRbdibsAeOR/6kmv2h58N
 yVXyzZapFEi8cRYw6N8DOPt6lgwCB2oBQGvzD5Zt3JZA7/zppnfSt1wBtUpwRep7xLpa
 Xxuw==
X-Gm-Message-State: ACgBeo3xERGLcs4LB6bFszrc6BxrumVonBsMujgVMLnRJhv0P/t9awz0
 9Izojtka/3Aq4Kowd3+2fN3ZeJBK5msaeOt+lUk=
X-Google-Smtp-Source: AA6agR4EqnqQ8u4MAgskdLzYc7FBqMGiJOS2HCVnpmnuXUvK+QJK2TMCY2lWLmDeQ8q/znqGKGcFd82tz2HFf86kF7E=
X-Received: by 2002:a05:6102:5709:b0:390:e360:88e8 with SMTP id
 dg9-20020a056102570900b00390e36088e8mr9131856vsb.22.1663031365543; Mon, 12
 Sep 2022 18:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220912182224.514561-1-vishal.moola@gmail.com>
 <20220912182224.514561-19-vishal.moola@gmail.com>
In-Reply-To: <20220912182224.514561-19-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Tue, 13 Sep 2022 10:09:08 +0900
Message-ID: <CAKFNMokZ02Ax9J3Ns_Q2PO8oeg+G7kgqQS7kMJMxSiX92_Vwzg@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 13, 2022 at 3:30 AM Vishal Moola (Oracle) wrote:
 > > Convert function to use folios throughout. This is in preparation for
 > the removal of find_get_pages_range_tag(). > > Signed-off-by: V [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [konishi.ryusuke[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.45 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXuQd-006PUW-Gp
Subject: Re: [f2fs-dev] [PATCH v2 18/23] nilfs2: Convert
 nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
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

On Tue, Sep 13, 2022 at 3:30 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/segment.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Looks good.   Thank you for reflecting the previous comment.

Ryusuke Konishi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
