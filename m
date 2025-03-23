Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F1A6CEEB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Mar 2025 12:35:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twJbq-0000wv-FJ;
	Sun, 23 Mar 2025 11:35:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao.sigma@gmail.com>) id 1twJbo-0000wm-P4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 23 Mar 2025 11:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vG33RxBwHa70Jw48weg1wd26DQIu8TvJqTqy3Mcpjcw=; b=Lh2atjz+gUwuR6cuSk6n9TEyGH
 6KKcDPNUohKLu4ysS8k0y2EQLcI1TPIGRdBwzmIgmNxACDYtJE+mipiUr8U7ewgyZxgxZETVXMRRN
 Mhobip0GRJuRdYfRgv5vKJBYOzFDr+RDRrk0dbMo7267HbS106m0vRu0xDTy+YA3Crqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vG33RxBwHa70Jw48weg1wd26DQIu8TvJqTqy3Mcpjcw=; b=j
 ylhJhXaiyjXcXuzgemSgpWSXTNx0F2FN332PCCLNzfO6zcj5wtsQ4UWnGrb5ZRltWGpiub8p4l8tP
 mM77BcxPkeksxcvXesJQglKenjTzKregTMR8ytoCw5LbNTjjHs0xQ0szWy+sbanNTnrblI6NCp02W
 ohPRIjl/2zrtc5yo=;
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twJbo-0007BU-54 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 23 Mar 2025 11:35:16 +0000
Received: by mail-oo1-f66.google.com with SMTP id
 006d021491bc7-602224af11bso1732499eaf.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Mar 2025 04:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742729710; x=1743334510; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vG33RxBwHa70Jw48weg1wd26DQIu8TvJqTqy3Mcpjcw=;
 b=IzCCzsLJXEG5xhUOdbR4+yykoQEIR1PRWFOARPruoSFBwOENYtSnbm8QzKNPz1Ie0o
 oQ68nnU+J9DPpL4WXlQHGwgPUVL7c43uE/o0DHwVaeefPduaG+Zee+7/RTSrWG+01ER7
 UfoRG6hIoMEi1XqBkXfHsj/7sdfOq/GJACuqpjGr7OOq863TQ6sQ88m9B6CCwecx345G
 yg5K924ZDXHyrlU+3MZsOEnUTPujWUbFxRk1Ovf5Wjr+9mWr/DLe4ugGoSbQT/jladO+
 YaVWqlhkK8dFrFcMt3fetItK5JOj5mN2nsA1j54Y2ccbhfGO6xhz0hgusq0J16gairOs
 +8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742729710; x=1743334510;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vG33RxBwHa70Jw48weg1wd26DQIu8TvJqTqy3Mcpjcw=;
 b=DPwL3rOw/Dc9NLyBkCla5en7uRipoWzX5CK0BqWN0Uo6zl4MkIAu1rU82ZRnZTDziM
 xQRKPD/iW7dkGqEUMiyEun1Ej/qQJSJg0EPdsD2VXbK3wKrh8QJYevBY7/KIR99cG2qn
 J/04fHrtlJJBg5oHfN4t7FO/uX4/lu1vDuMiDwcgoY2gcEblxzhFJ7B/twMvdaaGw3cN
 AJW7N8Q7BRnSIdqSd/8WEIIiAUTPYGZvQDAsE1GYMIE6ulE/qVr08lnc3dFvvMaZzaDE
 gVb5mBVR0AXRPkw0kEngqAqYqajUykNp83xVsuWSjVstHDH24j0Iq5Nb4p5OyyH50xNA
 BrRg==
X-Gm-Message-State: AOJu0YxLnKYrfN0GRd2blTgv6dBlkRUjXSmI6Vn5AyZ7slg731PC/4Ai
 gq9IrmLnt++UsoAalrO7D9pj1PyNtdRIZoBX/FnmUcdKNDOoY8VMWBtzBrqtgLEH/U4U1Z/w5s8
 oIe0NjEQfgVpcZjWcdjLrZqLehz5zBph1lBfVeg==
X-Gm-Gg: ASbGncuFfFUCbb4yGwiYq4JmXa0L1PGpT2IqLU3uEsdHIy4LynjtVCKCPRPJk4gFTix
 kj5iWScJxakuCpepl4PysHgHoR+LU/MsvUnE7AWegMtTYQNh9xGoyXmBFAqxIaZyJA1A0BVQmCU
 uwBAJS25y7y1rfB39Bs88etObTOwE=
X-Google-Smtp-Source: AGHT+IF0dM64YGcU3yY5TDvaEWU2GZ2u5fvzqx95UXCG0yAFljJiBQQwXUwT8kVchoEQADzwODGepSBXX2aJ0v7M6yU=
X-Received: by 2002:a05:6870:4686:b0:29d:c624:7c3d with SMTP id
 586e51a60fabf-2c7805046c0mr6144550fac.32.1742729710397; Sun, 23 Mar 2025
 04:35:10 -0700 (PDT)
MIME-Version: 1.0
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Date: Sun, 23 Mar 2025 19:34:59 +0800
X-Gm-Features: AQ5f1Jo1W6vsPMM2-iXx8A7YDl1JreiXd1bLFVmUu9stNHz8jduh6EEGwS0HCY8
Message-ID: <CAMLCH1FEuoDxFFQ8HuUdBDMfzsyaS2LWyVh+eyGCpgxnKGa7rA@mail.gmail.com>
To: willy@infradead.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Dear Mr.Matthew I hope this email finds you well. I've
 recently
 been studying your patch 'f2fs: Remove uses of writepage'. I understand the
 rationale behind it, especially with the page cache and file I/O increasingly
 adopting folios in place of the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.161.66 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.161.66 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nzzhao.sigma[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.161.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1twJbo-0007BU-54
Subject: [f2fs-dev] Inquiry regarding plans on vmscan pageout supporting fs
 writepages
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear Mr.Matthew

I hope this email finds you well.

I've recently been studying your patch 'f2fs: Remove uses of
writepage'.  I understand the rationale behind it, especially with the
page cache and file I/O increasingly adopting folios in place of the
traditional page structure. This trend indeed renders the legacy
`writepage` function in file systems not only unnecessary but
potentially detrimental.  This is particularly true for file systems
like F2FS, which, as you know, has already fully implemented the
`writepages` function for all its `address_space_operations`.

However, as you've pointed out, the `pageout` function within vmscan,
which `kswapd` uses for dirty page writeback, doesn't currently
support calling the file system's
`address_space_operations->writepages`.  I was wondering if you have
any plans to improve this situation, and if so, could you perhaps
share some insights into the general direction or approach you might
be considering?

Thank you for your time and consideration.

Best regards,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
