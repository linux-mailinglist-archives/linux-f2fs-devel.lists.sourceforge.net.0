Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E21676A2527
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Feb 2023 00:43:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pVhio-0001Z4-Na;
	Fri, 24 Feb 2023 23:43:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <37jv5YwYKAHESgdhTcVddVaT.Rdb@flex--drosen.bounces.google.com>)
 id 1pVhim-0001Yy-Tn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Feb 2023 23:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kcPGn+M6rIqx4tq8u4y5PnmVvUlM4XopORLae9pnp88=; b=RM0jqzUQii10sVeky3tSWiVnyv
 8cRd6gczjD8Lz5lEZN88GhOymMQoiMVbkif2w2QlZMDap46KyYz6NTzJdPKeSXooFu/nxGenG4k6n
 Nu9f0NQzj8Cp13tlFrAhbYA251vqwR0ngtXgwreTd1P2qjSYtsCPA4LydwsR5QM1MjZg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kcPGn+M6rIqx4tq8u4y5PnmVvUlM4XopORLae9pnp88=; b=J99jDKbXbegYxKwpP29ZOKJWvy
 wwOxJ7+qsEpFuLw0y7UDVx8QhGESXzo1sghUbNsjOOIwFxkX4nc5x22ab+JVZ4n/2dcW1Q6LJgwgn
 OD+KL5jqEG99O+w737RINbFBO2jayeJNtex9U9APVplFq4oe7WEs0EOtOgqpHMOB6KgM=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pVhil-00GVNU-L4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Feb 2023 23:43:24 +0000
Received: by mail-pf1-f202.google.com with SMTP id
 z19-20020a056a001d9300b005d8fe305d8bso271092pfw.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Feb 2023 15:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kcPGn+M6rIqx4tq8u4y5PnmVvUlM4XopORLae9pnp88=;
 b=QOKHFuzxD9Oty0a5Re3OcanrsUmjZ7YVrnvH6W2tuNQqBHXx+lQ3dG9qCPTRT0a+KN
 muI7pzifbe+Ya0/9S758YpqEubAIaILij0y/Yq6KSLuehY72U9iN2uC5eww/27YnHOwm
 7tT20/kgLULJFJO8cQqXDbuebovMxSKrMRNPoA1xisQygA71xz3/LuNX0FqUVFYi5sPl
 xTalxKiPHjmh+Le2ki3dJpFRoW8fewbUcfT4XSY/Iez8ee8FfAehpbz/raDXqdiTXAos
 YLdFzMOIW6Ir9rLt6BX0gsge+6jtZ75hVk3ZZEQ5IRZtYCw1ZRwcYo+1GdGCQ/t8rBcR
 VW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kcPGn+M6rIqx4tq8u4y5PnmVvUlM4XopORLae9pnp88=;
 b=ogMK5T8kVR17EbbOq41V5OZA9r6k4mEzwbHOjF0w+quSTpoQE58PN9gpL7lMznjgEl
 PUheGm8X0K0W47xBZAWoYYvIHA3pBO+TlP7+I1OA8VpfqmCxbekIr3u7cVgGgf391cbo
 zVKP+XmIIe0dYF0teSdEI05EGXWYebt7i5Q/66bwHKTqnCujtbY7FyndfqnsdBKtQgOH
 8LYGAaNwX9fQxktVvoyQNaOICe9gvSxdOwW3zLzPw6tzRD/FiRd+hfSJ8ggwyekCuLax
 RB/3VczHFfQLj4MFG62zn8x7x6E9u4fV5e2uVgj4wEHUPNMdQHrueXC6kEFDyGCnPg/d
 1Hcg==
X-Gm-Message-State: AO0yUKVH9qUbUTIbu3G1S7XBItR9J2E+x/dn+6KREfQCWl2WVS9QHhVN
 WtEkOs3cSP9dfwTh7VloDVsOnT2RE0U=
X-Google-Smtp-Source: AK7set9L2FIpwGMGECLyskWfXlzU0H7sjRSGI9vrEuoVRE3jOXUP1tVhvhXXfg/VsQ8P5PxI02LV4EYJTec=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:200:b35d:3867:2eb8:33e4])
 (user=drosen job=sendgmr) by 2002:a5b:301:0:b0:a09:32fb:bd6c with SMTP id
 j1-20020a5b0301000000b00a0932fbbd6cmr4015876ybp.7.1677278190733; Fri, 24 Feb
 2023 14:36:30 -0800 (PST)
Date: Fri, 24 Feb 2023 14:36:26 -0800
In-Reply-To: <20220622194603.102655-1-krisman@collabora.com>
Mime-Version: 1.0
References: <20220622194603.102655-1-krisman@collabora.com>
X-Mailer: git-send-email 2.39.2.722.g9855ee24e9-goog
Message-ID: <20230224223626.565126-1-drosen@google.com>
To: krisman@collabora.com
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: These look good to me. It will be nice to have negative
 dentries back for casefolded directories. -Daniel Rosenberg 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1pVhil-00GVNU-L4
Subject: Re: [f2fs-dev] [PATCH 0/7] Support negative dentries on
 case-insensitive directories
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: kernel@collabora.com, tytso@mit.edu, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

These look good to me. It will be nice to have negative dentries back for
casefolded directories.

-Daniel Rosenberg


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
