Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF1B81993F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 08:15:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFqna-00022P-6L;
	Wed, 20 Dec 2023 07:15:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1rFqnW-00022J-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 07:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eJqWdKRl0UBq0Wj+r8chL9QmhrnrulM60eoe1tH98KY=; b=LWs6GVQ7Kgsp2wh3TRJ9Gr5eAj
 cQZHDFWZ3K6quDAOdNBH6Z5gPyww/ObsRez55uKLFPFtRTrTCV1H9TLe6zNWAXbua/BbPcno8B+e7
 0JwWqnsLpYqapsrd7YX/bqjQhMWlQrwqkHJ6adoK5wZQDga1yXiPltczp7BU+O1zu9Fc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eJqWdKRl0UBq0Wj+r8chL9QmhrnrulM60eoe1tH98KY=; b=Vjjy/4/1ZcRuSebi8cPPft1zGi
 4YGT2fORB4R9h3m4uk/Tg1aVIhi7kOOLUCGcLfihYJVysg/md9e2+zL1Q4NNl52hqKCvCswkyzYd8
 zEu0wEmMwLkXLExeF1ztc+1de/XPve+bQnHDhJNpinSN7kw28zbd91Bl1MlECUrSGeaU=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rFqnR-0008It-Gi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 07:15:17 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6d3cb1ccccbso2169300b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Dec 2023 23:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703056501; x=1703661301; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=eJqWdKRl0UBq0Wj+r8chL9QmhrnrulM60eoe1tH98KY=;
 b=jal0okzfiroFpss1flbU33JkB58BqaT1NQCLFAgiAvJd8BCrOBtQdinEma2L7Gd5yf
 mDEaVvlAbDF5xbkQxQQW6dJMJfWEguZkR0JLN8KRjBvM8+YqzN00gXW57hYzcA2XXn2e
 QISK3FuEypBM4AEQ7AGZBoOUOxE69yQRxMokCFGJTRojEsuEQ1zniHHIUex7vzeoF2lE
 O2EE16IULGSWcKJ7CTYvCxO0g+3L/DN/s5RfvkwBorlwXxnUpG+yvR0+L3QrPG+JnHBQ
 tz3Ca90TCoZdaiwc7urVQ/LLPSFm3eFPwrmN6GRU24oZntos4ZnWoMXc4pkdI3T0ewpC
 rt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703056501; x=1703661301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJqWdKRl0UBq0Wj+r8chL9QmhrnrulM60eoe1tH98KY=;
 b=FWsRPwa5atP5mGA5infUuZhWA1SdK37CvvzVmPwLBuhxhFYZSrY2b9WqqPnBeOjONY
 aGHKvWFL8pU+hV4Alx6PpFP1ghMfN3qNliXNBrhdlWsAndM8PF26SSn90FORv211g1Tj
 2veMVcwpKbH4+KMpEEgJuz3dySwoUBWiycHbuGuq1ihrHiJ2nPP3J5MMuvxJfbFuGKam
 786PTtgI3mPqcduBx53nTi3gL1oEBprgqC5SxrWrTrew0kCzd6q65Y8Rpc4hMmB17Z9a
 +wa2CuBcyz2e/F1IOTfm56sQuPdbawR9VxQw2ZUI2K7ngKb4UykzbxqNkcxPEl6GF8zu
 NZOw==
X-Gm-Message-State: AOJu0YxmvgVX/E78ddQLzr3kAun9i/lnWcEgsZ4OdAQESX9Y0TFZU5qZ
 Cyy3QGyfnlC8upG+I+ykVMM=
X-Google-Smtp-Source: AGHT+IH2/KQGWsEEIk+CfQb//I/X1FN9i9PYn0R8hU2YQDfX0MobECujamcRsnvnV4o1L8WIa9T7SQ==
X-Received: by 2002:a17:903:947:b0:1d3:be34:7862 with SMTP id
 ma7-20020a170903094700b001d3be347862mr3583611plb.9.1703056501427; 
 Tue, 19 Dec 2023 23:15:01 -0800 (PST)
Received: from localhost (dhcp-72-253-202-210.hawaiiantel.net.
 [72.253.202.210]) by smtp.gmail.com with ESMTPSA id
 m2-20020a170902bb8200b001cfd2cb1907sm22210314pls.206.2023.12.19.23.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 23:15:00 -0800 (PST)
Date: Tue, 19 Dec 2023 21:14:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Naohiro Aota <Naohiro.Aota@wdc.com>
Message-ID: <ZYKUc7MUGvre2lGQ@slm.duckdns.org>
References: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, again. On Mon, Dec 04, 2023 at 04:03:47PM +0000,
 Naohiro
 Aota wrote: ... > In summary, we misuse max_active, considering it is a global
 limit. And, > the recent commit introduced a huge performance drop in s [...]
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rFqnR-0008It-Gi
Subject: Re: [f2fs-dev] Performance drop due to alloc_workqueue() misuse and
 recent change
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "oss-drivers@corigine.com" <oss-drivers@corigine.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "open-iscsi@googlegroups.com" <open-iscsi@googlegroups.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "ntb@lists.linux.dev" <ntb@lists.linux.dev>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello, again.

On Mon, Dec 04, 2023 at 04:03:47PM +0000, Naohiro Aota wrote:
...
> In summary, we misuse max_active, considering it is a global limit. And,
> the recent commit introduced a huge performance drop in some cases.  We
> need to review alloc_workqueue() usage to check if its max_active setting
> is proper or not.

Can you please test the following branch?

 https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git unbound-system-wide-max_active

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
