Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FAA727BE5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 11:51:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7CIr-000614-Dp;
	Thu, 08 Jun 2023 09:51:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phil@philpotter.co.uk>) id 1q7CIq-00060y-F3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 09:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7UW1P1+u4z8C1yYHhcCc7D6z205h5xRpA4Pis0U9UMY=; b=kcOwGU1KPtY5qE22XbAHDZxYAx
 u02ZW18JneZH9H2m+s6SLb8UiMBl9riThVZ9u/SbMw0KlKMHVuw6Ypp4cjAcR0UCkL+rHnMWtduFC
 PV6GTxKYXhnfkgtoHlqyhsgE3kZB3g3NiuMSw3nID7WPmQlvX/RWsVexcO8Z0zwVjr7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7UW1P1+u4z8C1yYHhcCc7D6z205h5xRpA4Pis0U9UMY=; b=SeH+mBamRzIN5+alQBpTJ6FWAb
 jgaSROKSp/dVudtNmHmL68DdaiUhVE/xWKt0Ielg/pgROlWxU9R5zYd7hrNtpo54Apr/8oGozs7fb
 X/L5ID+IAuqtXGXlqyILpAoudi5nm/txnTG3q3EwTzxzgYH8o8OlB9XdJc9XnrsJ7wi4=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7CIm-00Eade-Iz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 09:51:36 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b1c30a1653so3432161fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Jun 2023 02:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philpotter-co-uk.20221208.gappssmtp.com; s=20221208; t=1686217886;
 x=1688809886; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7UW1P1+u4z8C1yYHhcCc7D6z205h5xRpA4Pis0U9UMY=;
 b=FFq9AOBlooH5uGiOo4u0Mw6JSyvszVEwuY7y/MTzYJN6TwrDklEr6bPXExElD4Xycx
 tXPeOqcvbGuNN3rmjBC+RvOmuth1JfdbA8tUiv1ePcRJ1BWsL6R/vDrDK7vQ99uFEo4o
 P0msyHIhb38U5rItg9IIC5lbYH3YFrMMvyDoSouyJkOscWcz2ajYaI2VsLmKi1i2Wu1A
 xfK5Y1EL9zkcziZ9rUgSHf4qyMElbPJX9uwt+J+R+77TEc6zLoKb0Ju5rRJWNEu2zXSh
 b6X4WfCkCUSqt28yzVj7p1qCzURhMvhQxAzsIEmGeZjFBvqId0lPThd4hz2d1zkUbxDP
 FiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686217886; x=1688809886;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UW1P1+u4z8C1yYHhcCc7D6z205h5xRpA4Pis0U9UMY=;
 b=a2eTr4etv+s/EEy8LJDOAyU+TAqueQfTCWqcpv8IhgQxTz0WXe+lrTbUgS2wHf4kgB
 CWZ0KeKtPhE0WA1Zu/C4gc/YkOsuwW5Ygaba5v8JYKyvmW2QeZY+VOR7jGf0qANOzzKz
 KhHqb5L7y9+9c23wsRjTLDQo/ALrL8oO+Xf9cPuZUG9xUp6Rt5GtLPbeEMnkT3wcCOUD
 LULAwDzp+rs2nGnzKIJmhvnR2lC1Z5WIy6ZuVf0qo7bYtC/ifhnL+QXVfufZlQipuDsm
 z+DZ+qYnLJjzX4DIgTOH6vsBMupljPRRUTOftq4B3ZOM/CRxze6plDMcsVD8naCQr31S
 Pocg==
X-Gm-Message-State: AC+VfDxLaALz6pgiCOmokrC0h8+LKf4yymP2CMYQ6PCN3aceeQk7OB3J
 SCkcac1Y4r8aVXwf5DGvEPiBpgzEJs1X1P43Gn0WAm9J
X-Google-Smtp-Source: ACHHUZ55+QiuKZDDVF2xerotwpMLkKmO7qQkxSxt7AJ+yBOXmT5EW03OqeXuJJ7vWtahwa0aPclqwA==
X-Received: by 2002:adf:e60c:0:b0:30a:e3da:efe5 with SMTP id
 p12-20020adfe60c000000b0030ae3daefe5mr6178509wrm.32.1686217463182; 
 Thu, 08 Jun 2023 02:44:23 -0700 (PDT)
Received: from equinox
 (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:dfde:e1a0::2]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb51000000b00307bc4e39e5sm1027878wrs.117.2023.06.08.02.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 02:44:22 -0700 (PDT)
Date: Thu, 8 Jun 2023 10:44:20 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZIGi9GMGeKruSrrW@equinox>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-7-hch@lst.de> <ZH+6qd1W75G49P7p@equinox>
 <20230608084129.GA14689@lst.de> <ZIGVn9E9ME26V0Gn@equinox>
 <20230608090444.GA15075@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230608090444.GA15075@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 08, 2023 at 11:04:44AM +0200, Christoph Hellwig
 wrote: > On Thu, Jun 08, 2023 at 09:47:27AM +0100, Phillip Potter wrote:
 > > Yes indeed - I was under the impression it was appropriate for [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.169 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q7CIm-00Eade-Iz
Subject: Re: [f2fs-dev] [PATCH 06/31] cdrom: remove the unused mode argument
 to cdrom_release
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Chris Mason <clm@fb.com>, dm-devel@redhat.com,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Pavel Machek <pavel@ucw.cz>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 08, 2023 at 11:04:44AM +0200, Christoph Hellwig wrote:
> On Thu, Jun 08, 2023 at 09:47:27AM +0100, Phillip Potter wrote:
> > Yes indeed - I was under the impression it was appropriate for a
> > maintainer to signal their approval of a patch to maintained code using
> > a Signed-off-by tag due to their involvement in the submission process?
> > Apologies if I've got this wrong, happy to send Reviewed-bys by all
> > means.
> 
> Signed-off-by is for the chain that the patches pass through.  You add
> it when you apply or forward the patch.  Just give me a Reviewed-by
> tag and say it shold apply to patches 1 to 6 and I'll add it.

Thanks for the guidance. Please apply the following to the block patch
(1) and the CD-ROM patches (2-6) of your series, all looks good to me:

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
