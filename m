Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08C9454DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2024 01:21:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZf70-0002Q8-KZ;
	Thu, 01 Aug 2024 23:21:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1sZf6z-0002Ps-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 23:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SRYsGq2oNdjeIvoc5FsVQQM4eH9uksp2HnfPLkPQWTM=; b=BfWAj55ihSZBKpZSOEOs3D665U
 VtlBKMQS9yq5T5uyM/vRaGWyAwIu3D8huKFxhmYt6Jp+UIdmrwWJcKciO1cM6X3k3ISmRiJkOSLzW
 T0Opjj0HxdrUwn4Whfcw4C48cOsX1EWUxiAti+QPbabTdEst3X9IsC6xC8PjvpZ2YnM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SRYsGq2oNdjeIvoc5FsVQQM4eH9uksp2HnfPLkPQWTM=; b=IiOAA4COtYmjrfZbZ5x2sDHGW+
 uZBT2f551tBOWW1QJ62dRXXPDNTZDZB7uXexJQFDsgkal99h22ziW4SyaeD2OdQ00DZWfTEOoazmz
 osh77BgIkjZDohoIUrivV/PPYvsbpdDQED35aqI/Zx5fuLI3yNzMjNoCrqPLnde0APlE=;
Received: from mail-yw1-f169.google.com ([209.85.128.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sZf6y-0004te-6s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 23:21:33 +0000
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-65f880c56b1so61063947b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 01 Aug 2024 16:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1722554481; x=1723159281;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SRYsGq2oNdjeIvoc5FsVQQM4eH9uksp2HnfPLkPQWTM=;
 b=vJH7pfkm+n/XxFRyCgivLiWS1nYSaq6PDIHMG9YDjofOfziPA9XeRzDcVvsahGXkco
 b8a0YBXY/2BdAx5TdMrHqfbZLscACi57X4ratBT/sy+yrU09iK4hVbU+INWz1KZLKDRi
 LahspPcrjsr//5CexeXH1k3KcMb4K0a7yOWWmBDL5bm/RLlFHixvQTHNqj6xL4PoF02q
 aY3P4Ib0GsIP0hzAxHARyLvaIzbyPAStoqi3QbVZei6BbR+dBJajW74J4lZAKdTjF88v
 F1TKpq7ZfScaZh1gyeX3s0X2Exek4KWUhsgg5nFTsfDNQVUAF1x3ekrvYotgK9b3d6Tg
 sWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722554481; x=1723159281;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SRYsGq2oNdjeIvoc5FsVQQM4eH9uksp2HnfPLkPQWTM=;
 b=MabzE7tOMvlDT9Y1CJkmDkzvIyHinKtULSt/KnHgM2gty8WW2y3VRK1MfXiYOMBDMh
 yJhqP78YC9iK0xQRicI/ulwxEz2jk71WNwwylC6i8xI2Iq3Cy1ZwyWBJpRFBWBg0OXvD
 2vEp73qOeGON8tAf7kZOgbpNQrx/5ELnHhnL7vX7lEf/kZfrvRnSZ/zCFzQ44vuQGgL5
 xevy2TQX2Sax2LTNtVeWMyPl10pGPMFJ2sm+vH/QuTGoN1D3upYuC9qqGI1x70jXTfxf
 cD8PS+622zxeSl/hBFSAp/QFNrlJtv6UaSsD4Ff7OikP42d44Wjk7SFqZvCQh+yjWWPU
 2dJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWonHFXsa+0j+Y6lBCjmDXNAQIxoMGQfl7MDxc55gRSvi6/vYoRkTwvng6L8ogM9vTUQJYFjXDz2nK9G8WRE3PDvOOM4J2D8sJdrGX/+fTS7qQGryNJ9A==
X-Gm-Message-State: AOJu0YyqsDsZbIpEvyb2EgvbEqg+WIjZ8vs3b2e9V8EWnG1G+fJABPJR
 zFoVUbPeOzwwl8CnZS9J+YNWgUDbYFmmyfUIDkE8NqG9yMHQC26DM+ZM5j/IhdT5ZRMqW4OgIV8
 p
X-Google-Smtp-Source: AGHT+IG1VyhF7PulV5hUfA0sl/95gL1I+laFS95TuUeXZwqOhTGd3EUHP2S1u9L3VUz7PeMN4aTczg==
X-Received: by 2002:a17:903:41c3:b0:1f8:44f8:a364 with SMTP id
 d9443c01a7336-1ff5743b598mr19821295ad.48.1722551322289; 
 Thu, 01 Aug 2024 15:28:42 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-47-239.pa.nsw.optusnet.com.au.
 [49.181.47.239]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff58f29f52sm4084735ad.32.2024.08.01.15.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 15:28:41 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1sZeHm-001yL8-31;
 Fri, 02 Aug 2024 08:28:38 +1000
Date: Fri, 2 Aug 2024 08:28:38 +1000
To: Jan Kara <jack@suse.cz>
Message-ID: <ZqwMFjz7TYgV+hbo@dread.disaster.area>
References: <0000000000004ff2dc061e281637@google.com>
 <20240729-himbeeren-funknetz-96e62f9c7aee@brauner>
 <20240729132721.hxih6ehigadqf7wx@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729132721.hxih6ehigadqf7wx@quack3>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jul 29, 2024 at 03:27:21PM +0200, Jan Kara wrote:
 > Also as the "filesystem shutdown" is spreading across multiple filesystems, 
 > I'm playing with the idea that maybe we could lift a flag like [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.169 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.169 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.169 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sZf6y-0004te-6s
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in rcu_sync_dtor
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Ted Tso <tytso@mit.edu>, paulmck@kernel.org, frank.li@vivo.com,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Oleg Nesterov <oleg@redhat.com>, Hillf Danton <hdanton@sina.com>,
 syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>,
 rcu@vger.kernel.org, viro@zeniv.linux.org.uk, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 29, 2024 at 03:27:21PM +0200, Jan Kara wrote:
> Also as the "filesystem shutdown" is spreading across multiple filesystems,
> I'm playing with the idea that maybe we could lift a flag like this to VFS
> so that we can check it in VFS paths and abort some operations early. 

I've been thinking the same thing since I saw what CIFS was doing a
couple of days ago with shutdowns. It's basically just stopping all
new incoming modification operations if the flag is set. i.e. it's
just a check in each filesystem method, and I suspect that many
other filesystems that support shutdown do the same thing.

It looks like exactly the same implementation as CIFS is about to be
added to exfat - stop all the incoming methods and check in the
writeback method - so having a generic superblock flag and generic
checks before calling into filesystem methods would make it real
easy for all filesystems to have basic ->shutdown support for when
block devices go away suddenly.

I also think that we should be lifting *IOC_SHUTDOWN to the VFS -
the same ioctl is now implemented in 4-5 filesystems and they
largely do the same thing - just set a bit in the internal
filesystem superblock flags. Yes, filesystems like XFS and ext4 do
special stuff with journals, but the generic VFS implemenation could
call the filesystem ->shutdown method to do that....

> But
> so far I'm not convinced the gain is worth the need to iron out various
> subtle semantical differences of "shutdown" among filesystems.

I don't think we need to change how any filesystem behaves when it
is shut down. As long as filesystems follow at least the "no new
modifications when shutdown" behaviour, filesystems can implement
internal shutdown however they want...

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
