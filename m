Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBA158604
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 00:11:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MVj/cuEe2VzH0J3qwC7/Omf6tS9SjweegTeqxMtEbw=; b=i7WyYQzZf9q64UbdRMKLqf6ebC
	4ZftJLFQoKuBorkBBuP+aAwYL2YOhr9WlDIbhf4WqlHXk2mNkrnDagHfoWN/JY2B++3RdGngwoDz7
	ywL5pXb1JGnYWbXs7hCvFLvHRVcXxPs9Dv9iAmtmF+RwLvuSYsEIO5eRk3vDvUnjNqTE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1IDG-00059T-HX; Mon, 10 Feb 2020 23:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1j1IDF-00059F-8J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Feb 2020 23:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jHnULLRvzcnTmrApgk0J6kXZO0qLfuB4AVQHnM4cmAE=; b=HtiU1iJKb6yVsw+DKtlrSv/lgA
 03Hd7bEb11Q8TYJvEEiUZJzHb78ORHp8YxowCRoWVX5tCK34k0Nthm4OoXF4E4Tvt616AI2y3cFao
 7omaLWqn4JLEhXuOo2TJjvOAfdm/v1WavWHrsuXgP6zKhhlJE17icyXWQDpcxVD/cB5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jHnULLRvzcnTmrApgk0J6kXZO0qLfuB4AVQHnM4cmAE=; b=VaVWEZiJir8jvm1w3npY5ihHtU
 414zV6Je6RuKDR6touI1y4f6bhi6uyRSbw9oiKrcq3U+/P7dLcoJNJjr8m8iO2GiNAd7LQl16x1ef
 irZHS6OkMDUzh/rRtHVe7T5xqAL3c6RCrQMXZfwl3EjNzAOjYx3vN70L1QGeLTZEj8Io=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j1IDD-00803L-Pw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Feb 2020 23:11:33 +0000
Received: by mail-lf1-f66.google.com with SMTP id r14so5573442lfm.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2020 15:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHnULLRvzcnTmrApgk0J6kXZO0qLfuB4AVQHnM4cmAE=;
 b=esB/56n6Q/Msdc20g+jexMovttxt6hCUBxvlvmdqGEumLlcmF5aj3v38oGR21nFNxo
 cOk4ekYVR6FdU2NjqUfNrI3LKVvMII6sqM7sSRTkqviALl/XYnv7z0n+5b5yYI3Lni/Z
 pHlhrG3K7Bp+8RWOpjWHLKMsY1f7PTIEy4J/RPb301AvTHMZeUbf9QaVy+/1sChmohPn
 5sq+e6/X6b3sYiGh+ziR8racoEm4OmMe/es+FRFQCba4zTFopBh8xK7owBMwffjbGKty
 kt8xNXlsArGuuruRAvzftXBAFrERmdhUUoEdMwiUrXKqtFq9YOe+1lKW7UiPQs4r9v/n
 YlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHnULLRvzcnTmrApgk0J6kXZO0qLfuB4AVQHnM4cmAE=;
 b=DhZUabYMtefLmAOh84QHLRWNNY5zfvw53emn3R3BGomRHGx190yp+eVs0RDWZ/NdK5
 HZd8r/QvvCQSUEhB70VOt95iYVosDKG4oVn2C4g6HRH4xruA7NVkR5Ue2yPJykSeaPVz
 q2WtYpyjLAOsu9bkhIY5pQxUJ6yzYXJxe/bjmaed8ESm5vVf73ymrVx2jn4JeWcI8D9p
 GrkbGNaDQdwqFipDBFbOxzXfcOI8ySjRTabXCTf7Y8zRV3Hyy6xyu3d4ptkHlmZJhjgr
 /f6XhwVae2uKTUu6HIr2MAHydCAd0nIhZpduNPcfBAd/qr8X6mbuqPQB4S/4cLWCD5Cl
 t5cg==
X-Gm-Message-State: APjAAAUfPIMu5gQBxfI7coacA+ls/xmCq94bKq5TsC/LJNbuZ9NSZMSL
 7yOaOT9CNNttfSmFYA8nQpZVXIYiCD5im88c/aL5Ng==
X-Google-Smtp-Source: APXvYqxiERXVniVJSVLKbVx/xqUKUzq4lPf5gqhBdctRYV5+IUwsgO7mOTwXnfu4yRdcGlrvRlDwJrZV+Drqhe6D0W8=
X-Received: by 2002:a05:6512:2035:: with SMTP id
 s21mr1781905lfs.99.1581376284825; 
 Mon, 10 Feb 2020 15:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
In-Reply-To: <20200208021216.GE23230@ZenIV.linux.org.uk>
Date: Mon, 10 Feb 2020 15:11:13 -0800
Message-ID: <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1j1IDD-00803L-Pw
Subject: Re: [f2fs-dev] [PATCH v7 2/8] fs: Add standard casefolding support
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
>
>
> Again, is that safe in case when the contents of the string str points to
> keeps changing under you?

I'm not sure what you mean. I thought it was safe to use the str and
len passed into d_compare. Even if it gets changed under RCU
conditions I thought there was some code to ensure that the name/len
pair passed in is consistent, and any other inconsistencies would get
caught by d_seq later. Are there unsafe code paths that can follow?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
