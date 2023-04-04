Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EBD6D62D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 15:31:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjgka-0006lg-12;
	Tue, 04 Apr 2023 13:31:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pjgkY-0006lZ-F0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 13:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o9gRzrJioyaXd7x2Nt5LwWdJliejgTOkFIZ6yPNQB8M=; b=HmWWSpH0GhnL0u6mc9uI2lfcrl
 sggIgVuZ5P//CnGoYV/cZ0n++RD205/a2SXfbTz34ZeZqEq7LCB5aYt3D1iYHwzbsk43iaE9lMoXG
 YozrzZFuTW8PSyCm8FA8Tk4sEDSLnK+kzSO3kmwXT7KWV78JNZZs7suMdU2rgcP0vdHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o9gRzrJioyaXd7x2Nt5LwWdJliejgTOkFIZ6yPNQB8M=; b=LZW3aBXkaJpnMeYvP+4yx3LAmx
 A97rh/9UVkq5rel2xZlOMooweT6pyXkpdugG2rQQta3hWasxPhEflu1FNeu3Wac+/QMVv4kthd/Rw
 OoQGunGBfXxCwr1er4i4lvBRA3NdZc8GhG/6xwshj7pyPJH2SVvYEGKaObKwLxnS8+2w=;
Received: from mail-sgaapc01on2110.outbound.protection.outlook.com
 ([40.107.215.110] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjgkV-00EtwG-Gp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 13:31:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLW+FfGLbFNH0K6bSuFthBS/jJNQQewTzP4m7ZPpvd7Am8U67RuL3QrSk6Hia5NvxLiGAaVDyhlyFTgfJ3BS1Y+FBC+aw/hBjcY2+UadrjsMqqwUKwc6hPYSnfzS3iwggtaZuPWwLye2w2RFo/bKPd5SwAShKVrGvkPBI4yuqTIPbXBhGB95B5yx5Vsj+3Qfp91Z/brffrqXBqO/NEDhkNDuzJ5/9iZOTp/v60S89h/gl90AJZ5Mgrnu5VTS9GrK0VVP0TO1lir8xdmpEj8r+M1eddFLE4BQnf8pmIPWVppJYCGMRacwFFVjfbijgn8uzPiJXx7m8oQxKkhvdrEJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9gRzrJioyaXd7x2Nt5LwWdJliejgTOkFIZ6yPNQB8M=;
 b=h7j3T9cXJBld+9xJQSOTknxSCAoe+0vwTVs+7rA9wv0QuatbUGEnEMTH9I4YTvaNiXZo2TVU/7/mWBtedexXmpfpHi8eTJSk7ixfSk5VaTJDwJCYsl2Q+o4uuA7Q+olwZFRrLOoNVcN3VnfYl5uDVf7P6rvZocQlP4zPnZTgVe8RUMuI3d5P+veoXYt/V5a+YGdywNMvrbdMxF+UyBScnAzFrhDk27Vkjv2mEG1QQx+gu/1pCuGgzE/7Rl52Eel5/bmjtIULo4AZmCMVLw6lfF1nTCEeOjGVKSWeos7YVepyvNzMrAqjytLjnROHDxvOpg9I0u8vQRRRAvR++XUlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9gRzrJioyaXd7x2Nt5LwWdJliejgTOkFIZ6yPNQB8M=;
 b=i+boe1mrB9bH8RQ0WUqR4nlBCrj/YrH90RKuJZq77MVzmLBSKbWu08HJbppLWYB6gKXGPViFAJx5O4VU2dtpo9m5vwIURruNRIehpcgtlA5Iuz6O2R6fIqxkQa3iNaUZNXQ5bzvVPKIVvjR3wd2bA+32D79iBlYrjHYSKxWCni3Vc8gEoPZqw3M6LtPtXd2oM1ir0Me7v8KWk9xenS+7Qxlbeg+RaduepbeuB9apDuNv2tkwNIYDXDi+54OxQgxi0kcfU5Buzb1n/dqsc+94K4KSVzlILDL7iz+PhG6lFxoEV84WYiX5/TmAr5DC126aBad+T/S6Rf221yr0+G7vIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5493.apcprd06.prod.outlook.com (2603:1096:400:264::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Tue, 4 Apr
 2023 13:30:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Tue, 4 Apr 2023
 13:30:50 +0000
To: ming.lei@redhat.com
Date: Tue,  4 Apr 2023 21:30:37 +0800
Message-Id: <20230404133037.66927-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <ZBvgpBzEuFuyOD/c@ovpn-8-16.pek2.redhat.com>
References: <ZBvgpBzEuFuyOD/c@ovpn-8-16.pek2.redhat.com>
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 5498de48-66d1-4654-42e7-08db3510ce6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPbuGoDXSeq2G8qkidRuQc+pmreSvZwgk/1fJdOkk0W38cqYc+nwLeHEaJz+HGEtwSXfngK9mpg0jT9VyhweX+cNrUVV15Au7aEQYGqQ80t4zzz5AHAuKZ5c7qM/sRPikYHcrKVXs7RSUtFEEX3kuNWBlvjtvFreJf6XlTID+luPcQf0kThxZ/0mJ523uTsOOLZIBhAZiypsGTt9+WK7ydJJ48hoCXJIQu7p+/52pwBnm54Z8WfVUTsvROIcOK64OLReVHatnVBY/q/M1I0O2x0AqBtquZXrysEXv+l2PKmH+JyVmV6W+kEm035IJPdupdzhmNX01y2Mtp8YgmHBrQNyRU32kx+KdK5HWtY9Zp59IGNF9XfyQ5W05ccWU/FOUIkklurkVn1qb0MsjGsEL42sTNt0imLWPPvwJfv/i8SSAHhq4VjOAZAgnoNG9l33ZXhCaReORrLING3UJXmRaeNvxOaIMqp3DOCfVQOI6ZrSF04CC2Onj1dR9PN3efROEPYBRp47zCaOC4uiAL413FIZKeYVv/O2g8P2ob7J2dFcNOtewb0BGxTn8agJByiF8hst1rR7L50PNJtKVKZjJ64fs+6t2497MauOuL0lYDzErupRuJBHpiR9zEC485Qe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(36756003)(4326008)(478600001)(41300700001)(316002)(66476007)(66556008)(6916009)(186003)(66946007)(8676002)(6506007)(6666004)(2616005)(52116002)(6512007)(6486002)(1076003)(26005)(86362001)(7416002)(558084003)(5660300002)(38350700002)(2906002)(7406005)(38100700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EWVPo+rePAbl9b4fCmMtkqjYyYgnmwI5L2Y14rUKFwmZ3yatRdZbP+ClBWlE?=
 =?us-ascii?Q?CfsWhGbCmnDIreNr6bd9xgqlzhRQ21tg9mJlOSi8mt2bTfH/1QYXhgnekwFN?=
 =?us-ascii?Q?K97EJEJJXjky440IsufLAaWT8NyYExlqT/fFolEfO5fk5mrwcyNPRn35uhNz?=
 =?us-ascii?Q?cU2rUalDdO4BeD58o8UOXRMx0PTKlP98CaYgsi+K03aRznL9WWbm9F4RSl/q?=
 =?us-ascii?Q?OdUatbj3ge+/+/x1GwtHdNtLx3sy0CPDj1sG+hWAngpYuhucDgbF64Z8uJU5?=
 =?us-ascii?Q?hjGGsb5Augroy7h6Jp+IPwn4u8MyFkv5/eLfVR100maTq2hzhJEJHukivZ+c?=
 =?us-ascii?Q?xi75G6PBsjocgUinQ4uj5MrkovI42py3ID3HzTQRxwx8N1pYJP+FE7QS/D+M?=
 =?us-ascii?Q?5VreflTyaDG4AN/bDlXZIlgdN9+6o+XkWz/EQbWaco7SWjUoHy6X3lrvvkby?=
 =?us-ascii?Q?Bu1cykM5++pCDIg5kgVYUaWYxueV2q6u07Gy7A3aFcU62i59PrI1FM2qYF4J?=
 =?us-ascii?Q?x3kkrW3KbIn77mknRdmztbt0cC+9Ze8NrxVrOJguMjDLHV3wNMHC7aOC1Aq0?=
 =?us-ascii?Q?CQfvvDz3yiCs2SX1H0hO3WLeiNILsPQX2Qd/syr5oKqmPjWHpid8pxEFJ6Cj?=
 =?us-ascii?Q?nFhjE/k2m21ykLEcV5ZITMBA88mmWTNY9xUsiL5S6jB/9IwZx4U8wNLSfIsW?=
 =?us-ascii?Q?F/QryYGn/lBT26hw24BXlYkF0eHPVEo/JaJvUMqZR3h1FSU7jW1I/FrMOgNA?=
 =?us-ascii?Q?HIzt3bEZw5OfSK2mtwrGX9SBCbOP/uuUPe28iwUY/cQ/5uyaa8Vkw6rz359r?=
 =?us-ascii?Q?D8lxpV6Nym34mS0AgVTtEACZx5Xu9eqQoB9+zV22q786IIZCpVZ/u1v3SB5t?=
 =?us-ascii?Q?5HxQT3MZp9CpB3EaEbBG9wKykcIVCUvCYxkUBOLroghn8FFlu/wXxUqqCl1H?=
 =?us-ascii?Q?8xT9rZPxFQs0t0W/Tdl53KfI60aYRL1o6VGM5+8vsz8qY8CHjOZnPx8o/q4D?=
 =?us-ascii?Q?y8cxzvt1PHpboeYgAz82hFW2znF/CRq43d/epb+eM45fZeJXNHR2Fsf3W7/9?=
 =?us-ascii?Q?1Df1SHGNdlW3jN5DibB/sNB7sXQUXC9g6m3xMoRB+YiGn+t4VEP3M65OC6eR?=
 =?us-ascii?Q?9THbCHAPnLDxTYovcR/2CO0nB5ieuXOmrJwayfRvk07GSDNAZUhLyBHDzU1v?=
 =?us-ascii?Q?LmvniDkvzwSXypGzxbEetX1KlQwlBn2GCqcN7/TK1Su/tZeyJspIflh+eipD?=
 =?us-ascii?Q?UKR10qP1c6Dz5Dn0iE+7BXqWKD06oUUVeDufyoQwenL4FRZm1x8xapsktt57?=
 =?us-ascii?Q?4A2LVdmxgVCnZMYgug3ecGwVnEMO8IiW4uGBkD8+RLjoQ7YoHBzh8j2OjxcW?=
 =?us-ascii?Q?HXLxRYyRIZlX/GUyL+FQmkVaBvtgIkQ3E1FJ6U6ZWefzL8YjIy1DcVMlCR1b?=
 =?us-ascii?Q?P/IaWbwe7Z0bG5LGvSRIUTXW2V0BvBLrPGyI3A6oCzGLnmquM+S31uvH6jd3?=
 =?us-ascii?Q?INDAXZzBYgFpi4HuwGufWhc8bNJeNGj+YdUft+mXgYd/TmtvpwE5sDEVQ6uH?=
 =?us-ascii?Q?xSw9jn2IWVr/jMKiMw7+RHZgYl44rcztuNBjxTwb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5498de48-66d1-4654-42e7-08db3510ce6a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:30:50.5709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QahJKytFjz88voSWSaNP4RkI85OPOy1WR1g//Xa0iYLVZ2jUi+okTVlTOIjOUpr21yX90z6tp1puh6RxqtwMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5493
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > kobject_put() actually covers kobject removal automatically,
 which is > single stage removal. So if you see the two called together, it
 is > safe to kill kobject_del() directly. If the reference count is not
 abnormal, kobject_put() does contain what kobject_del() does. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.110 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.110 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pjgkV-00EtwG-Gp
Subject: Re: [f2fs-dev] [PATCH v3 01/10] kobject: introduce
 kobject_del_and_put()
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: rafael@kernel.org, djwong@kernel.org, joseph.qi@linux.alibaba.com,
 linux-mtd@lists.infradead.org, naohiro.aota@wdc.com,
 linux-nilfs@vger.kernel.org, richard@nod.at, damien.lemoal@opensource.wdc.com,
 trond.myklebust@hammerspace.com, xiang@kernel.org, frank.li@vivo.com,
 josef@toxicpanda.com, huyue2@coolpad.com, dsterba@suse.com, jlbec@evilplan.org,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, konishi.ryusuke@gmail.com,
 linux-nfs@vger.kernel.org, clm@fb.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 mark@fasheh.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> kobject_put() actually covers kobject removal automatically, which is
> single stage removal. So if you see the two called together, it is
> safe to kill kobject_del() directly.

If the reference count is not abnormal, kobject_put() does contain
what kobject_del() does.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
