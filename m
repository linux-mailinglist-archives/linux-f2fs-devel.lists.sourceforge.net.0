Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE15B879F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 13:55:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYQz4-00084y-4i;
	Wed, 14 Sep 2022 11:55:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sudipm.mukherjee@gmail.com>) id 1oYQz2-00084s-Ri
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 11:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SyPBTrJvHzMyaHLtvwyxvW+j90fbMR931wFMQdu37/o=; b=Kaa9yGu2xphdSIemP/7hfi2GNn
 I085W1/T9p0AqPzyUWFmmB39ayIrFBovluVbnIps1CmvzyXaSdYSoW3/HhnG3AKkAuzN7cCm8SH7t
 I69e9A/acut3KmFInJ0k75oXTxr6B58eqFfLj1PBEFrzyjUApYKOCcIWea6deQ3RZVMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SyPBTrJvHzMyaHLtvwyxvW+j90fbMR931wFMQdu37/o=; b=C
 igeMRWborR+Gd8jm60nZQVzXLSSOfqrSSwMALWmXhYNPHkN6PGFYvlp+0wr2NWiAOlOmmWPcJQKxr
 zAbQFo7sC253zieh5vHzvwQ98Yz6jlB8LYvrEGR13cZPVf/TGjnRr/COWZ8pZkBDalSiCzk4cuG6k
 BMaQobaib4pfpbm4=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oYQz2-0007Ze-8w for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 11:55:12 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so15328939wmk.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Sep 2022 04:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=SyPBTrJvHzMyaHLtvwyxvW+j90fbMR931wFMQdu37/o=;
 b=BWHcjgqBlG2T3NBIzOfGGpZmejALUegR++FTvrF6X0D3HK8XJD04xKg9SN/VicszsD
 yEu18tlS4LVLHvsP+1+w1ZSlWCCUft/xk38vFKFomHB55CPeQFzJd8wFJYJNGGrWJAui
 6ifXPxDExUaYiYRJZhpgZlFeObvj76DWwHt/E8a/Y4mUKRuuGL0CubY3N2FItO5r4284
 UFg4UEtGnJ6hLWVZ3S3h4RH9QiLA6xfqgvdM+82GhScwlbi22Pt5OxofzGDwVAuhT2a9
 psCrmRLCu8NB0xZZyP1IONNj91J3WvPeRAruZkXvd43nEoHMVzDQQf47dLsZvvlFuepb
 zEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SyPBTrJvHzMyaHLtvwyxvW+j90fbMR931wFMQdu37/o=;
 b=XmeDpBd0zvuTRK1Vj8HWzPah2U+duZ71IdiKh3uyXG5KngXRQATz1VZiIiwYAbrOvl
 YERi2ocmpPO3Q5mOcUuXQAcHuJeJNcdMkKeb1hvCN+FIqq7rZ7IfuqsDefD6MO3q/1pG
 G0Z8syP2CHbLpw7bQGQL4rkktX3XrjdfRXfIFOAY/8EcxM/RGfvHMcMCIOmhmu1LwqlW
 nZ2I/xgxjMoQnCji0spFccxRbPyEYLD29m6V/MJxZnD0XEwa+Zdr8nfey56R/kJYA+LE
 XnK+HCngnflzzXySOHqdZLaITF+/ED718xtaAa/GxjuTzH85lAeV8lwAy9wts0sEhdH+
 u4Tg==
X-Gm-Message-State: ACgBeo1UrXsPuffXFDx7ucsTo9WzKPs2xW/V8KsGdcX9NF62+PFV9YPQ
 iP0g1frZblzXP0rUUKvDVgWjwh6z7e8=
X-Google-Smtp-Source: AA6agR7HMGDwDBAbBTgUT/pwa8dlEi72q6ixKfarSZZfGWkX7uH9vOdKskGexIeULnCicwW5B9SFbg==
X-Received: by 2002:a05:600c:4a9a:b0:3b4:78ab:bae5 with SMTP id
 b26-20020a05600c4a9a00b003b478abbae5mr2918176wmp.114.1663156505798; 
 Wed, 14 Sep 2022 04:55:05 -0700 (PDT)
Received: from debian ([167.98.27.226]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c47c400b003a541d893desm15968258wmo.38.2022.09.14.04.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:55:04 -0700 (PDT)
Date: Wed, 14 Sep 2022 12:55:03 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YyHBF99sC/vQdI3v@debian>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi All,
 The builds of arm64 allmodconfig with clang have failed
 to build next-20220914 with the error: fs/f2fs/recovery.c:509:17: error:
 variable 'ino' is uninitialized when used here [-Werror,
 -Wuninitialized] ofs_in_node, 
 ino, nid, max_addrs); ^~~ fs/f2fs/f2fs.h:2376:35: note: expanded from macro
 'f2f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.41 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sudipm.mukherjee[at]gmail.com]
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
 [209.85.128.41 listed in wl.mailspike.net]
X-Headers-End: 1oYQz2-0007Ze-8w
Subject: [f2fs-dev] build failure of next-20220914 due to 64c11570d64d
 ("f2fs: fix to do sanity check on summary info")
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi All,

The builds of arm64 allmodconfig with clang have failed to build
next-20220914 with the error:

fs/f2fs/recovery.c:509:17: error: variable 'ino' is uninitialized when used here [-Werror,-Wuninitialized]
                        ofs_in_node, ino, nid, max_addrs);
                                     ^~~
fs/f2fs/f2fs.h:2376:35: note: expanded from macro 'f2fs_err'
        f2fs_printk(sbi, KERN_ERR fmt, ##__VA_ARGS__)
                                         ^~~~~~~~~~~
fs/f2fs/recovery.c:475:11: note: initialize the variable 'ino' to silence this warning
        nid_t ino, nid;
                 ^
                  = 0
1 error generated.

git bisect pointed to 64c11570d64d ("f2fs: fix to do sanity check on summary info").

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
