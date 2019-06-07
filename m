Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B86F3937C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2019 19:41:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hZIrf-0006oO-HS; Fri, 07 Jun 2019 17:41:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kimbrownkd@gmail.com>) id 1hZIrf-0006oH-2P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Jun 2019 17:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mZTYGju8Lc1Vw+PBsp6ZhKXJXzOEOqXl38jTX2RDW6c=; b=UDAHrMkHHxNIiF5+rGIMgtDxEA
 SkPdHlSfGPOvF22kWSDBe+NniVCqGjx46UhVPBnjTIXe3oYstL/wTVG6kMqJ1Uj24HmqTrAPljKLA
 sVRj7wlxHTVTgKmnNYyklqbVVXvmyMmyz+rqwc0rgOemDI6yx3v0y961TUgdvpzBQqmA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mZTYGju8Lc1Vw+PBsp6ZhKXJXzOEOqXl38jTX2RDW6c=; b=F2BqmVO05GEXasDD92QrmaFGGL
 jaTSO6zcTF/S1k1MgXICZHPa+CGC/OUkbKaSv4Cbd/wFLMO2XKX1jXKbKeOON4ZZHCBbg4GWEEjBe
 EW/96ylobHXbluzmOzKsCd0wiEbsAeXkpTyhYvmZfkF7wGl3OZ3Relb5palvHF/+00OQ=;
Received: from mail-it1-f195.google.com ([209.85.166.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hZIrc-00HKYg-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 Jun 2019 17:41:18 +0000
Received: by mail-it1-f195.google.com with SMTP id m187so3950003ite.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Jun 2019 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mZTYGju8Lc1Vw+PBsp6ZhKXJXzOEOqXl38jTX2RDW6c=;
 b=dXoO+OElj6Gj7lrthzGFiOpNWlZZTYx7AcrAJzNvdkaHweAMtfWrnjJdIZgEOSEV6P
 wWIc4CXwAqYEitGXtCNVqVBu4v0EsF3KJ3UJWrQrh7KdTKh6w+DY+qeHetFA7SbHSXhZ
 QYUKSPnflShdpZGed0bDiyaBdEL9NPZjPdCz8JCTQzMw1OpfJH3GyBc6iLBpmDieKEgf
 AJRdI9LGgDEXXZQYqrHmgS2zXD1QNiYmPEcOewshGVmdihS0US2IZ0A3thjqZQcWxMwL
 quetjcV+cUyeEXr+TFTKVO0aDPvZaO0ny6in/SN2wn+RKYCR5R1WiL2acXx7SDAzO3FF
 3PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mZTYGju8Lc1Vw+PBsp6ZhKXJXzOEOqXl38jTX2RDW6c=;
 b=XbHIw3isN8KXK9DdM1fmfLhpxqTVDgUISHFXXZ1JYSuz6U91K6DD06NIoZQ8l9uDxK
 uPgQp3qdzwd35knrBatvpTGR1GGmkdemm/Q0o9ZxtZ4N/eSRJJxlH+n8y0NHqGNGTWfB
 fcBQkTru76CtRpG7LL+cJOAX0RnS1+gzxC+ahE16hbuZrLriBcg7926CgDGSoS9BH7Qd
 /T8ppgDbMazfMoNo4ifEMzE2WpBxqzg+cEIzpEO/MOxd1jZSyIH0ve2wAYO4ba2qSZFK
 mL/TvPz/RyFYkFzA0l7P69Mk+dVmj0wXfXFQWD0X0goE6evawc8BdDLxL+akRJCjosOD
 AiGA==
X-Gm-Message-State: APjAAAWMf4rI7NOFL/I0sPMe76H25tXdmkgi5huUZmDtLvJsGvJNq/7a
 huJzwmGM8vX35UeHf3o6GuE=
X-Google-Smtp-Source: APXvYqyBPTdmHAYkX83K+3hbXN6JbcHLil/4cD/BDyW4FofdOVJsH6C3leCRNZzzFF3ODsBXIAm2mQ==
X-Received: by 2002:a02:69d7:: with SMTP id e206mr37601616jac.21.1559929270547; 
 Fri, 07 Jun 2019 10:41:10 -0700 (PDT)
Received: from ubu (2600-6c48-437f-c81d-59ab-a761-9e83-29ee.dhcp6.chtrptr.net.
 [2600:6c48:437f:c81d:59ab:a761:9e83:29ee])
 by smtp.gmail.com with ESMTPSA id 15sm910997ioe.46.2019.06.07.10.41.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 10:41:09 -0700 (PDT)
From: Kimberly Brown <kimbrownkd@gmail.com>
To: jaegeuk@kernel.org,
	yuchao0@huawei.com,
	gregkh@linuxfoundation.org
Date: Fri,  7 Jun 2019 13:40:41 -0400
Message-Id: <20190607174041.11201-1-kimbrownkd@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (kimbrownkd[at]gmail.com)
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hZIrc-00HKYg-Uy
Subject: [f2fs-dev] [PATCH] f2fs: replace ktype default_attrs with
 default_groups
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The kobj_type default_attrs field is being replaced by the
default_groups field. Replace the default_attrs fields in f2fs_sb_ktype
and f2fs_feat_ktype with default_groups. Use the ATTRIBUTE_GROUPS macro
to create f2fs_groups and f2fs_feat_groups.

Signed-off-by: Kimberly Brown <kimbrownkd@gmail.com>
---
 fs/f2fs/sysfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 729f46a3c9ee..5c85166677d4 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -501,6 +501,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(current_reserved_blocks),
 	NULL,
 };
+ATTRIBUTE_GROUPS(f2fs);
 
 static struct attribute *f2fs_feat_attrs[] = {
 #ifdef CONFIG_FS_ENCRYPTION
@@ -520,6 +521,7 @@ static struct attribute *f2fs_feat_attrs[] = {
 	ATTR_LIST(sb_checksum),
 	NULL,
 };
+ATTRIBUTE_GROUPS(f2fs_feat);
 
 static const struct sysfs_ops f2fs_attr_ops = {
 	.show	= f2fs_attr_show,
@@ -527,7 +529,7 @@ static const struct sysfs_ops f2fs_attr_ops = {
 };
 
 static struct kobj_type f2fs_sb_ktype = {
-	.default_attrs	= f2fs_attrs,
+	.default_groups = f2fs_groups,
 	.sysfs_ops	= &f2fs_attr_ops,
 	.release	= f2fs_sb_release,
 };
@@ -541,7 +543,7 @@ static struct kset f2fs_kset = {
 };
 
 static struct kobj_type f2fs_feat_ktype = {
-	.default_attrs	= f2fs_feat_attrs,
+	.default_groups = f2fs_feat_groups,
 	.sysfs_ops	= &f2fs_attr_ops,
 };
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
