Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899310F8D6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 08:36:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic2jq-0006dz-Ht; Tue, 03 Dec 2019 07:36:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gaoxiang25@huawei.com>) id 1ic2jp-0006ds-8E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 07:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nju1865Mpu7QzDeqHBtZsKlFkRzYaqFXovnW4xHkBJE=; b=hHeBB8nAn3zpIQ4Y3eksyHowQi
 eNsoocOo7Vub0Qiqg0NctyvN2HiIb8BW63zJQnLx3P4w4HOXVw1G0kSutLvdZFcVjbfF7Yi0n5lVt
 tMkxk9Eec3MKLHV0RU+SciJUwqZqL6Wk/g309kmgn/hR33UJ1PZSju1DjAgWK2aTXTYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nju1865Mpu7QzDeqHBtZsKlFkRzYaqFXovnW4xHkBJE=; b=mJ2RA9ky7AhfbBjuQRyxAs827R
 G5uRfdea0B7686mEUaU+u8/Tk/YjLq4wbQzGw4VCxGaQyg7A3ZK4KAH9VZ2LQ2eqfWwEhk6Qc2v3H
 btGzj1ye6Xp3obWC5EVfyQlcQld3T6aVUeM4VmbyPoie3yna0bE9WAstyhcnQrsohf+g=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ic2jl-001q9u-3g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 07:36:49 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 7819FD447DA005F45EFD;
 Tue,  3 Dec 2019 15:36:36 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Dec 2019 15:36:36 +0800
Received: from architecture4 (10.160.196.180) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Tue, 3 Dec 2019 15:36:35 +0800
Date: Tue, 3 Dec 2019 15:41:54 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20191203074154.GA216261@architecture4>
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203051049.44573-5-drosen@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.160.196.180]
X-ClientProxiedBy: dggeme719-chm.china.huawei.com (10.1.199.115) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ic2jl-001q9u-3g
Subject: Re: [f2fs-dev] [PATCH 4/8] vfs: Fold casefolding into vfs
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@android.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Dec 02, 2019 at 09:10:45PM -0800, Daniel Rosenberg wrote:
> Ext4 and F2fs are both using casefolding, and they, along with any other
> filesystem that adds the feature, will be using identical dentry_ops.
> Additionally, those dentry ops interfere with the dentry_ops required
> for fscrypt once we add support for casefolding and encryption.
> Moving this into the vfs removes code duplication as well as the
> complication with encryption.
> 
> Currently this is pretty close to just moving the existing f2fs/ext4
> code up a level into the vfs, although there is a lot of room for
> improvement now.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

I'm afraid that such vfs modification is unneeded.

Just a quick glance it seems just can be replaced by introducing some
.d_cmp, .d_hash helpers (or with little modification) and most non-Android
emulated storage files are not casefolded (even in Android).

"those dentry ops interfere with the dentry_ops required for fscrypt",
I don't think it's a real diffculty and it could be done with some
better approach instead.

Thanks,
Gao Xiang



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
