Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB7DB17E82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Aug 2025 10:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SrzzrjvtIACjB780vW5TZPYeu7QsZQrfxGMQZH2ddbM=; b=fKZwsQRvhc5Gkl+aqkrlrGuhZ/
	ehIZlZ0GbJgZ9/7+gpTHQ2DBI7Ju4iMck5HIUc4yI/LCAlg4TMWZ4n7YAUtcuG/N22u3I9FE9MUmU
	oMKmxI/SQiVqaAgbWVAOdkNBLMNrptqHXQmegczzFt0QeifV8bqr49abVdyhmtbdNfo0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhlP9-0005Oo-Ri;
	Fri, 01 Aug 2025 08:46:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1uhlNw-0004u7-7K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 08:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XCObaerBx8Elh3O1ORhZUMVQWsbQpfcTGuBZaH139eU=; b=k5gFmKff7o//bgANp0QeQDBLCW
 LgjXcaqpzxhkq+aTfC0wMTd1Nu/6gR28YLyDO5059uKruNIvNnormPGXOkcB18ljbQ87zUwkWOWjK
 LPZsXrCGPLG2y8oaxifcS7U/uTl+W9ioVnY1rvg9zrBrtxa3vmMzScLfM8zEtNzsRZSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XCObaerBx8Elh3O1ORhZUMVQWsbQpfcTGuBZaH139eU=; b=l
 Zsy7aefwQCPsETzBBRbYWdZ5T7lbThUQOFh2NmgfJmNh6f/i2AL0Orr7ijuwlUUFNAZNf5FvPgp/x
 fAZb4fUZoLqpGcKg1D+CrHj9NmxRYHjxuTE41CBCnM+EAHUmANRDaZOMOhz1DZeQCFctxLHstXmZh
 B2sxVanseTojPMzI=;
Received: from mail-koreacentralazon11013009.outbound.protection.outlook.com
 ([40.107.44.9] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhlNv-0006HP-6o for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 08:45:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcZGKGXbwVfHMzY1z4ev7swyENCdz0K3m9ywvbF5COBiP1oG31E2Ep327GqnMoEu4bH+a5CyB//aWhN1X/gcpu/HPrI/R4mKZdG++feFoMX3bNCmq+Q3v/G4GU+ZiwcYhFF/fb79noRq1NcIsMgT8iMnVcv7C6MqbQ3IqzljC1cdn3GzM+TtEeBRgz2iJANuw4axchy/7tSEWw2f4ZLtvwrYkmRebmR8VeZQDLVwni+iKPbwUD3SDi5GrPXUZW+ApiqwNW7oVVgsEr4iWbdxDEpChIgVdOByrgwKLEaLdx20TGBiuyDkhV7ICrDzWL0S4jXJHlDw1O2AGUTQaGwhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCObaerBx8Elh3O1ORhZUMVQWsbQpfcTGuBZaH139eU=;
 b=UlaETHsyJvX/Ed6elt01zSJKBvwjEHcPnQgfuFCABClEJNyzv73vv+IC4MqY5XTTdKWfALi2PSgJtS9D4jXsc25S6fx8JnrAFGMHAmfZh++Mb7NCTnQHlg3ptRlTsSWZ8pi9Vm3rpIg3/Qocpz72VuDwOS+QoKpklTO1PRNrNVU0gxIrA7mXRf/1gcXoF42VtR1yqrp5EOTgwc5DzTI6Q6zkpkUURMG3ClveAZu8LzSwxGTYpon9/EcV74h9ja5KdfbPR60VswxO1wOmrjDKR4PHBNCj+JSgerDMKp7ZjMw4xjk3K0azKryHAUYLV99rZ7EPyO92Gt4nPsNBBjTx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCObaerBx8Elh3O1ORhZUMVQWsbQpfcTGuBZaH139eU=;
 b=UEqUyF5qyWHJfyTehtVEgh8BndhZqLS8w1s6FTtUdScnuIoKh4ZfiCee4Mb4k/G/V2r+voYcm+zioNRmI2ynEmE8F4NBScVmUvdkLPvG7w67MsesxMg972HttrH48hE8zcQWV+vN/Ih4BOPdYkmgivMEgAsDXalx+JKG5e1N97z0zBjyt7qmeYTRlhggIIt5JmUfxrOXbIt09Dx/qLapzGrNE325pH7N9yKN7Zedu4iNXgbR/LmKDZUGVKh6FVYaUEkQbHmGSPZROVXIXtVfazSj7C+L2fpiKZ7Mnfp1AG1jD8s4Zdwr30+Cf5J2PDpKKe6N6x94GHtGqxTm7b5s7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by KUZPR06MB7987.apcprd06.prod.outlook.com (2603:1096:d10:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 08:44:49 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:44:49 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  1 Aug 2025 03:06:47 -0600
Message-Id: <20250801090647.2674590-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|KUZPR06MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc4f4ad-9c29-463f-cbbb-08ddd0d7ac74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vuq1Jb2tw7LJDX6zGFu1dBSSCeuOUfCaCmAchrGV4UOo/qGiJ10iXC7T61S8?=
 =?us-ascii?Q?clhKDB2X/NGOM0XNpGkTHqlrV7MC9pNCyLaNxCSxKQrsCRLJuOU8haG+byOI?=
 =?us-ascii?Q?Vf28LVSzRlfg3eAgqeottfWXpPSqqgGsUVQfxaW0/CzpWWL5cRB1MxurDjD8?=
 =?us-ascii?Q?KBngzG+sM8/W3jfJro2MYv7FNM7AMGl7cOW2bCmhSJcFS8q+ut7GwHRwkR1K?=
 =?us-ascii?Q?lBdI11hXMuEvlh+PCwvG17Y9nYKCgQ9mCNruiYKE6kJtUMZ+yWRqB86XXSPV?=
 =?us-ascii?Q?YFr5V+mJViaBlLxwZ7wHXbUYzD5VHVY/ABqwYgcso02eB8SzFrtORx/jZZjJ?=
 =?us-ascii?Q?QhoF761QXnQ8Zev6+XGn9vsANV2kWLt8rDBBz9WBL985+6MMRw/LP/V5gzDQ?=
 =?us-ascii?Q?d3O0GSa83iF4ouNtcUwkjwIhYZg9iz+RTW7+lUIPwrQVL3tYx3XEDkJ32U+k?=
 =?us-ascii?Q?SCgTubeDjwXS5gh2NrPUtadppFOQ/gmUVgbb1KLKysooO03M35CWvMerEWcm?=
 =?us-ascii?Q?+Bpt6y+ehOg1c4s8tND6efYRpNfWsv4TVCXtUFdhR8275oyjIVyNwejwSxJH?=
 =?us-ascii?Q?rhgxm2tyWh14OMTAQPMp3VLtlqemzOdeCEQzsjsj4fDLv9Nd38Uc18Bib93I?=
 =?us-ascii?Q?whUkpTugUrh+L+beVE35SVWdQwWDsj6n6+1QYpPT9UNokG7SSYQdob2MdiVa?=
 =?us-ascii?Q?O4220T726NIYB2X3shgKj+6lMmlqCHAYxALozIhW4hHGVEEn15jcTPgiSQNA?=
 =?us-ascii?Q?qNWNGWvj+ZibcIzKlI7eToLMGW8dqDOfJ5Y26mkVV//eOiCAJOEsOuowNR8g?=
 =?us-ascii?Q?s7vwASDZ4M9n6khL/35Pch5XT9TjxGJsYBnnsMdWks3JX41XtzaVvCYNV5b5?=
 =?us-ascii?Q?6GE5RFFg5YPzH9H6zuG62C7ilYxngnnuWq126putH39r3bwGPjY4UBwfeIGp?=
 =?us-ascii?Q?wmUUHsSN0yBeXcoJa+MYrZAr/CofMP3eLqpEVPWSN0L5VQp8+itkmwCbTxIB?=
 =?us-ascii?Q?0UgbRCKScf9q6Wymy88+3QsKhMkJV+kNi6Gt3d8dOQhV4kWlmSlsfE4b4zyr?=
 =?us-ascii?Q?ziaKW32qb4GaDZDN26nxGFDKoaiTX60dAEKxRpdirPKW+UGsx8aTlWoRLaUD?=
 =?us-ascii?Q?CbqHev+QDVZoa3z+4e1biRBJSnxzT8b3V/+OE8xU5UK0D3mb2yomMDfDyTjR?=
 =?us-ascii?Q?VcnrIRxVBFIuDOyYZWr6ePVhFmaydzMdlY6W6y4i8cGRkeiiA86o6JI7nmBH?=
 =?us-ascii?Q?ToH+5rXGUnabztX11728SSrvJLHOjq1Mo0BOpbVSfwVt1DDJbpwh8i2KnKqA?=
 =?us-ascii?Q?5GVtKTHK9OGPqWC5WPa7IcwMSGPJO0iVz6Wzrbus0Xk257rQUZ3xojH1rb8j?=
 =?us-ascii?Q?nT3gmfIeU1kAJOpxHIvKQuPmtgn03usOi75fp1uNViapIFHXjpRCFQsHfObg?=
 =?us-ascii?Q?gGPLXj9NZh4f39UVltsZbL1TZ3szztL/yqYVCBLUpBzaDkDgLNyhmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+VzIKGa5qz+2kkYisZF0pmGaPTwSnOGTNGNfqvphtb40HpJYMpmgWMToqs2T?=
 =?us-ascii?Q?dRX1kCB8lxkU4J4GXsoXYZHfofmkM+ImokgNW3aocVMX6wSyKqz4Fjg5DzML?=
 =?us-ascii?Q?kYLpUy8tk2E3ym10/D7zcKg582Xr/G3c/jSMmLyJynvc+5uPRGVaPadMxM7K?=
 =?us-ascii?Q?glB+QZ2BVRHc4LHiz1NXzFf9HoBoAfn9KUIkxInZOVJEJxkOhks1BGFmWQrl?=
 =?us-ascii?Q?yASZJCcA+vPOggVp1trXImNq2UZ8CjJEfVYgHymtQ6Ddk6nxOOqKhEc83EB6?=
 =?us-ascii?Q?utjDpCh+5gA0NNRTxAb6lckNH4eTQQhrTGUfeKs/VM/kg4gYeTxj+OmNLm9O?=
 =?us-ascii?Q?/CzSSNKi/OeYtc5TOMZmWHDsreUz9coNGIFRRXh7sKZW35KX0kMPl54dWK+N?=
 =?us-ascii?Q?6XjrwgcztGzrAI/mE6uxG0NgvltYHGRVGf7uV/dt18N1HVWWTnjNEwCQT5jX?=
 =?us-ascii?Q?uxdrq8TDI91aZPKpn1sFYBG6uX29Jelc6Neu29RBt7LOBdebNl23hBnNfig9?=
 =?us-ascii?Q?Ktn4XrNuXuc2doZKS9jAH/r/s5hS4YYUHyBlUCAklnSd658FhscKVNA+nKVi?=
 =?us-ascii?Q?hLbXqPyA+A0/IohyWb4JhnsxTclwODGY1qBAFw8Vnv7kDcc/PGjvTzoA5b7K?=
 =?us-ascii?Q?+UNfRkctRXm77vL/HaoXeoZZmh033AWwRIwTrUcxlDL4zp8HvV6EBzONQv4Y?=
 =?us-ascii?Q?r577rflWxlkHJhyz9mQ+q1eVZd4/C0xcmGLAc0VNiFJxDng1sKMgAlGh9wlh?=
 =?us-ascii?Q?Nz7JvwN6U6CRti2CjZxtX/qlArSL9PPan/HmNAA9yf/UEVRMILLQYI5bjyjx?=
 =?us-ascii?Q?lFg8M86HYsC79SVJd/W8MKHSP9P6SI4eFxlSndjEnMwqrwF8UQGMax1GdCPI?=
 =?us-ascii?Q?p7etSV7LLofQnXFfxMMWUbtUAxhxOCSJToAELjoz0w+y+iowQQpFKOXuorZM?=
 =?us-ascii?Q?1Ho7GWUt359/nC6LpA8oM0uwFiHCvMHHaCKOQZbSJMHKoAo4hOpzPPwPnVtc?=
 =?us-ascii?Q?c70Wp+dkMp1aCNZeMn7cVlt7QGTX1kfqkdpP43Cp/LDryzfXJE5co2kmdUK+?=
 =?us-ascii?Q?M0W6bwXiUzyjjnt1xPSrCjUObo8D64GEIKmwkerTFAuZXd0szBRAKjZ7a4cR?=
 =?us-ascii?Q?ka93QMDyeSSxLON510cy2gXTYgC/joTOTq9tgp0egfSmM87VKyD3gk2O4Qd8?=
 =?us-ascii?Q?LEAAYPKayIxSSNa7WzkeyZ/709BD3ZegkF0GJCRr/q9rpoBhUiH0QbxPODg2?=
 =?us-ascii?Q?Dj1N1pjh0ycb1qrbSCsNjPZWBX5XbV2gJQHmulliy/BTHTKFqiq5frhWTSX0?=
 =?us-ascii?Q?yCh+AEbRRKA3CwvlBt2JwkgRLTilYgz1CpxZ9UD9hm821SAxNfnk7eiR9BkA?=
 =?us-ascii?Q?x7QRAhXXQ77u1SryIqQ3jYBtYHM3ANew7A27svDHpgUXjXk24WktvU3US+OW?=
 =?us-ascii?Q?wsiw/5Z3uOu0SXM2eLm5lt4xEyxMFpYQoB2D3XJ7DCf0RM9g30/2b9YVi6dU?=
 =?us-ascii?Q?+ACm2/ifZXOu8gJ9bXaHNRFptZrqyOOj1mAv2uK00VQqQwYR5WxjwaSMBaz6?=
 =?us-ascii?Q?J8zC7O+cAucivjQOnqusGjElb85g6DnyHV3K10GM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc4f4ad-9c29-463f-cbbb-08ddd0d7ac74
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:44:48.9264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDuVKjLifYc+Ms3MtwheWRL1+lrbUcZ+2mMPTgPwKV7kxxfp/WZZUsldBaYV/1NhigPIpzxbBhBodF66WMW+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7987
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 53333cdf5b03 ("f2fs: remove unnecessary null
 checking")
 removed the null pointer check for bio in f2fs_grab_read_bio(),
 meaning f2fs_grab_read_bio()
 will not return any errors. Therefore, let's [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.9 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
X-Headers-End: 1uhlNv-0006HP-6o
Subject: [f2fs-dev] [PATCH] f2fs: remove unnecessary error checks
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 53333cdf5b03 ("f2fs: remove unnecessary null checking") removed
the null pointer check for bio in f2fs_grab_read_bio(), meaning
f2fs_grab_read_bio() will not return any errors. Therefore, let's remove
the remaining error handling code.

Fixes: 53333cdf5b03 ("f2fs: remove unnecessary null checking")
Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/data.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 711ad80b38d0..89cc5dc47c72 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1095,9 +1095,6 @@ static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 
 	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
 					folio->index, for_write);
-	if (IS_ERR(bio))
-		return PTR_ERR(bio);
-
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
@@ -2148,11 +2145,6 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				f2fs_ra_op_flags(rac), index,
 				false);
-		if (IS_ERR(bio)) {
-			ret = PTR_ERR(bio);
-			bio = NULL;
-			goto out;
-		}
 	}
 
 	/*
@@ -2306,13 +2298,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
 					f2fs_ra_op_flags(rac),
 					folio->index, for_write);
-			if (IS_ERR(bio)) {
-				ret = PTR_ERR(bio);
-				f2fs_decompress_end_io(dic, ret, true);
-				f2fs_put_dnode(&dn);
-				*bio_ret = NULL;
-				return ret;
-			}
 		}
 
 		if (!bio_add_folio(bio, folio, blocksize, 0))
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
