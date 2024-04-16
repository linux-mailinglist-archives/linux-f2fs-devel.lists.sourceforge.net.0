Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF58A7702
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 23:50:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwqgk-0001mr-0Z;
	Tue, 16 Apr 2024 21:50:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <paulenes252@gmail.com>) id 1rwqgj-0001mY-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 21:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:Sender:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PeJSQjXoeRPXw3p8u9TEscDTfpHxwIvs9oTVQ3qAsQg=; b=VarPaHTOR2bbtEjOSQMHTuTcYs
 wgt/kPLntI7kyCkfdD8KWqdLxW4UHGF9EEb+cI437iDx2iW98EC+qr+5+XN963sVhNQSEiIaCbNuK
 yGSxccssCijw8p9O8eJsGkRhpSOxkQXqFfZUG27SOWq/WZU0TlqVJk3L0ByFtMY/HBjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:Sender:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PeJSQjXoeRPXw3p8u9TEscDTfpHxwIvs9oTVQ3qAsQg=; b=PFiml7PSZhyK1jK5nXcXCXh/Ob
 uZFVP40cWZY6GoECuiCp1y48vIBnu+jrbsks44P993JPRynXfKDsQ9zG+s98nYo9kCVQdkxuoRwcH
 mjnsxDLqyoNPuOozQYv4nhSCe5hNeUEvoCembywOVMIiwCc/70Cs1V64Xt8qfYeLk3m8=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwqgi-0000kr-UK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 21:50:01 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41881bce4b5so16991845e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713304189; x=1713908989; darn=lists.sourceforge.net;
 h=reply-to:date:from:to:subject:content-description
 :content-transfer-encoding:mime-version:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PeJSQjXoeRPXw3p8u9TEscDTfpHxwIvs9oTVQ3qAsQg=;
 b=WeXZeIHHLw1SPMENzMiGpJ+OUw+G/X1I0ooiqTfxju2PGdhvLG7lvbUlhFQo1+qwmM
 RioldaLdAECLbmd5evED5VdK/PwQmV4o9ukRPj4PokUVUjR9dN17ZupYtRniQn2O82ZC
 1pTbtVyvEFjWbd2TthloD0TnAWXr7kZ9Stv3Sv+7p0WorlRvOuRccgW6Vf3roivAFjbT
 PBf8R628hc1CGCbpswBtEqWFEWx2AJeP4unnacSc8fGj0E9Q+KidUyTxB6ytdp6/SiUH
 n9M9TGyq/5vTZ9YsYTrbJwvReA8EAJIGYZm7yG0hrEve04Z9QZOnMjHt03QvTY9eDl1D
 z+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713304189; x=1713908989;
 h=reply-to:date:from:to:subject:content-description
 :content-transfer-encoding:mime-version:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PeJSQjXoeRPXw3p8u9TEscDTfpHxwIvs9oTVQ3qAsQg=;
 b=Sj1UdaJGdkW+zp4FbeXHfpJy+8bgSmKjFO7XsEATtoAniafJYfrWJtLxXSkK8z4mqF
 kjzDpGlKkdMi7s8zrfNmFI6v8ErplbdwfFFAtKlpPVONUanyaKca3QHHsxgnQnuhguGe
 OijOyegHSjgCjj9VIVnRH+ErtxZ8cGKX36MYv9Mgkk4YSQ9npaq/dQDL0d1RVIBe1B63
 TU4Jmm44MmPsImjMP60dSQJX5MFC+o3+YOXycxF687j2tjseTgPSCoJ5SsAAZ+a4Xy5G
 mu9OvqU8R6cZBVegzf7+oX32p9XjMWtWBncZnj3LuwwKtqq34PjFJUjcXAAxg+Z3f1fn
 DBkg==
X-Gm-Message-State: AOJu0Yx3twu5dHWqx0wAZ64eJj+UGaMx1GsVur85ERn87GtJKA5gqA6Q
 MiByVpoZmFiZEXXnwOy20+fbfC1ajAIsUfJHgr1LflCnncZ7Qmd1ySSHZrU0S5dxy4Su
X-Google-Smtp-Source: AGHT+IEwB4Iwqgw+EOQeGdUIKf95FqmYwN7u0vC8PlWQ6RGFpiakTxeZyDCk4Ie3DSML71IjhryQaA==
X-Received: by 2002:a05:600c:a4c:b0:415:6728:a565 with SMTP id
 c12-20020a05600c0a4c00b004156728a565mr13973721wmq.16.1713304189061; 
 Tue, 16 Apr 2024 14:49:49 -0700 (PDT)
Received: from [192.168.8.102] ([154.120.104.13])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d4045000000b00346ceb9e060sm15063382wrp.103.2024.04.16.14.49.44
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 16 Apr 2024 14:49:46 -0700 (PDT)
Message-ID: <661ef27a.5d0a0220.b7a76.0bff@mx.google.com>
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Dip Paul Enes" <paulenes252@gmail.com>
Date: Tue, 16 Apr 2024 22:49:30 +0100
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Attention Sir/Madam, I hope this message finds you well. I
 am writing to inform you of some exciting news regarding the delivery of
 your consignment. Diplomat James Morgan, who has been mandated by our company
 to ensure t [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [paulenes252[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [dipmorgan7[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [paulenes252[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.44 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.9 URG_BIZ                Contains urgent matter
 1.0 FREEMAIL_REPLYTO       Reply-To/From or Reply-To/body contain
 different freemails
 2.1 ADVANCE_FEE_4_NEW      Appears to be advance fee fraud (Nigerian 419)
X-Headers-End: 1rwqgi-0000kr-UK
Subject: [f2fs-dev] Very Urgent Reply!!!!
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
Reply-To: dipmorgan7@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Attention Sir/Madam,

I hope this message finds you well. I am writing to inform you of some exciting news regarding the delivery of your consignment. Diplomat James Morgan, who has been mandated by our company to ensure the safe and prompt delivery of your consignment, has just arrived in your city.

I am delighted to inform you that Diplomat James Morgan has successfully completed all the necessary procedures and documentation for the swift release and delivery of your consignment. He brings with him years of experience and expertise in handling diplomatic deliveries, and we are confident that he will ensure the successful completion of this important transaction.

Given the significance of the consignment to you, we have arranged for Diplomat James Morgan to personally oversee its delivery to your designated location. His professionalism, attention to detail, and commitment to providing excellent customer service make him the ideal choice for this crucial task.

We understand that you have eagerly been awaiting the arrival of your consignment, and we apologize for any delays or inconveniences you may have experienced during this process. Rest assured that we are doing everything in our power to make sure your consignment arrives in perfect condition and within the shortest possible time frame.

Diplomat James Morgan will contact you directly to arrange a convenient delivery date and time. Please ensure that you are available to receive the consignment or designate a trusted representative who can accept it on your behalf. You may be required to provide valid identification upon delivery, as per standard protocol.

Should you have any questions or concerns, please do not hesitate to reach out to me directly at dipmorgan7@gmail.com. Your satisfaction is our top priority, and we are committed to resolving any issues you may have promptly and effectively.

Thank you for choosing our services for the delivery of your consignment. We appreciate your trust in our company and assure you that we will continue to strive for excellence throughout this process.

Wishing you a seamless delivery experience and a pleasant day ahead.

Warm regards,

Dip James Morgan


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
